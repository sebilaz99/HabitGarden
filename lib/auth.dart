import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'database.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Stream<User> get userStream => _auth.userChanges();

  Auth() {
    if (_auth.currentUser == null) _auth.signInAnonymously();
    userStream.forEach((user) => print("USER LOG: $user"));
  }

  changeNickname(String nickname) async {
    _auth.currentUser.updateProfile(displayName: nickname);
    await GetIt.I<Database>().setUserNickname(_auth.currentUser.uid, nickname);
  }

  changePhoto(String photoURL) async {
    _auth.currentUser.updateProfile(photoURL: photoURL);
    await GetIt.I<Database>().setUserPhoto(_auth.currentUser.uid, photoURL);
  }

  static bool isLoggedIn(User user) =>
      user != null && user.providerData.isNotEmpty;

  bool isLinked(String provider) => _auth.currentUser.providerData
      .any((element) => element.providerId == provider);

  bool hasProvider() => _auth.currentUser.providerData.isNotEmpty;

  Future<AuthCredential> google() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    return GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  Future<AuthCredential> facebook() async {
    AccessToken accessToken = await FacebookAuth.instance.login();
    return FacebookAuthProvider.credential(accessToken.token);
  }

  Future<AuthCredential> twitter() async {
    final TwitterLogin twitterLogin = TwitterLogin(
      consumerKey: 'nkIJrTlleaOfXerkosQDRKamn',
      consumerSecret: 'W4flLl2GW86zC8jwVYPTs0FycokB8GaLEMfMgqeMcMR6Q4Y7z0',
    );
    final TwitterLoginResult loginResult = await twitterLogin.authorize();
    final TwitterSession twitterSession = loginResult.session;
    return TwitterAuthProvider.credential(
      accessToken: twitterSession.token,
      secret: twitterSession.secret,
    );
  }

  Future<AuthCredential> getProviderCredential(String provider) async {
    switch (provider) {
      case "google.com":
        return await google();
      case "twitter.com":
        return await twitter();
      case "facebook.com":
        return await facebook();
      default:
        return null;
    }
  }

  toggleProvider(String provider) async {
    if (isLinked(provider)) {
      _auth.currentUser?.unlink(provider);
    } else {
      final credential = await getProviderCredential(provider);
      bool exists = false;
      await _auth.currentUser.linkWithCredential(credential).catchError(
        (error) {
          print("auth error: $error");
          exists = error.code == "credential-already-in-use";
        },
      );
      if (exists) {
        if (!hasProvider()) {
          GetIt.I<Database>().deleteUserData(_auth.currentUser.uid);
          await _auth.currentUser.delete();
          await _auth.signInWithCredential(credential);
        } else {
          Fluttertoast.showToast(
            msg: "This social media account is already linked.\n"
                "Please sign out if you want to use it.",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 18,
          );
        }
      }
      if (_auth.currentUser.photoURL == null) {
        await changePhoto(_auth.currentUser.providerData?.first?.photoURL);
      }
      if (_auth.currentUser.displayName == null) {
        await changeNickname(_auth.currentUser.providerData?.first?.displayName);
      }
    }
  }

  signOut() async {
    await _auth.signOut();
    await _auth.signInAnonymously();
  }

  void deleteAccount() async {
    if (_auth.currentUser.providerData.length > 0) {
      final provider = _auth.currentUser.providerData.first.providerId;
      final credential = await getProviderCredential(provider);
      if (credential != null)
        await _auth.currentUser.reauthenticateWithCredential(credential);
    }
    GetIt.I<Database>().deleteUserData(_auth.currentUser.uid);
    await _auth.currentUser.delete();
    _auth.signInAnonymously();
  }
}
