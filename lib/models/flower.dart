class Flower {
  // the type and the health combined will identify the associated asset
  // i.e.  rose_3.png
  final String type;
  final double health;

  // alignment inside garden, between 0 and 1
  final double x, y;

  Flower(this.type, this.health, this.x, this.y);

  Flower.fromJson(Map<String, dynamic> json)
      : this(
          json["type"] as String,
          (json["health"] as num).toDouble(),
          json["x"] as double,
          json["y"] as double,
        );

  Map<String, dynamic> toJson() => {
        "type": type,
        "health": health,
        "x": x,
        "y": y,
      };
}
