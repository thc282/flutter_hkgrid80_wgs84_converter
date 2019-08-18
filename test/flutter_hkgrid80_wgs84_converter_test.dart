import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart';

void main() {
  test('test converter', () {
    Coordinate coordinate = Converter.convert.gridToLatLng(825021.0714545498,835102.999960755);
    print(coordinate.lat.toString()+' '+coordinate.lng.toString());
    print('error lat = ' + ((coordinate.lat-22.364345495)/22.364345495).toString());
    print('error lng = ' + ((coordinate.lng-114.165563295)/114.165563295).toString());
    // Coordinate coordinate = Converter.convert.latLngToGrid(22.455351496828012,114.0675957100333);
    // print('x: '+coordinate.x.toString()+', y: '+coordinate.y.toString());
    // print('825021.0714545498,835102.999960755');
    // print('error x= ' + ((825021.0714545498-coordinate.x)/825021.0714545498).toString());
    // print('error y= ' + ((835102.999960755-coordinate.y)/835102.999960755).toString());
  });
}
