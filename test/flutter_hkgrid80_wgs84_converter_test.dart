import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart';

void main() {
  test('test', () {
    final coordinate = new Coordinate(
        x: 834349.252, y: 815894.556, lat: 22.281927, lng: 114.158256);

    // from hkgrid
    Coordinate latLng = Converter.convert.gridToLatLng(coordinate);
    print(latLng.lat.toString()); // 22.281930012478536
    print(latLng.lng.toString()); // 114.15824821181121

    // from lat long
    Coordinate xy = Converter.convert.latLngToGrid(coordinate);
    print(xy.x.toString()); // 834350.1488648592
    print(xy.y.toString()); // 815894.2762260285
  });
}
