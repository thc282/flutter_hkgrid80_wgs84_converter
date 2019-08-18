import 'dart:math';

class Coordinate {
  final double x;
  final double y;
  final double lat;
  final double lng;

  Coordinate({this.x, this.y, this.lat, this.lng});

  static fromRadian(lat,lng) {
    return Coordinate(
      lat: lat*180/pi - 5.5/3600,
      lng: lng*180/pi + 8.8/3600
    );
  }
}