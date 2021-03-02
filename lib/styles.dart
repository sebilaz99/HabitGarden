import 'dart:ui';
import 'package:flutter/material.dart';

const DARK_COLOR = Color(0xFF004368);
const CONTAINER_COLOR = Color(0xFF90C8F1);
const BG_COLOR = Color(0xFFF7E8FF);
const MAIN_COLOR = Color(0xFFBD83EB);
const GRASS_COLOR = Color(0xFF95EF7F);
const RED = Color(0xFFF84C4C);

const CONTAINER_LEFT = BoxDecoration(
  color: CONTAINER_COLOR,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    bottomRight: Radius.circular(20),
  ),
);

const CONTAINER_TOP_LEFT = BoxDecoration(
  color: CONTAINER_COLOR,
  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
);

const CONTAINER_TOP_RIGHT = BoxDecoration(
  color: CONTAINER_COLOR,
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
);

const CONTAINER_RIGHT = BoxDecoration(
  color: CONTAINER_COLOR,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  ),
);

const CONTAINER_MIDDLE = BoxDecoration(
  color: CONTAINER_COLOR,
  borderRadius: BorderRadius.all(Radius.circular(20)),
);

const NAV = BoxDecoration(
  color: MAIN_COLOR,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
);

const TEXT_18 = TextStyle(
  color: DARK_COLOR,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TEXT_24 = TextStyle(
  color: DARK_COLOR,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TEXT_36 = TextStyle(
  color: DARK_COLOR,
  fontSize: 36,
  fontWeight: FontWeight.bold,
);
