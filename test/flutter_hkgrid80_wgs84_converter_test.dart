import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart';

void main() {
  test('test converter', () {
    // Coordinate coordinate = Converter.convert.gridToLatLng(834349.252,815894.556);
    // print(coordinate.lat.toString()+' '+coordinate.lng.toString());
    // print('error lat = ' + ((coordinate.lat-22.281927003)/22.281927003*100).toString());
    // print('error lng = ' + ((coordinate.lng-114.158256007)/114.158256007*100).toString());
    Coordinate coordinate = Converter.convert.latLngToGrid(22.281927, 114.158256);
    print('x: '+coordinate.x.toString()+', y: '+coordinate.y.toString());
    print('error x= ' + ((coordinate.x-834349.252)/834349.252).toString());
    print('error y= ' + ((coordinate.y-815894.556)/815894.556).toString());
  });
}
