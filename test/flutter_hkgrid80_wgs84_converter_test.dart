import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart';
import 'package:flutter_hkgrid80_wgs84_converter/models/coordinate.dart';

void main() {
  test('test converter', () {
    final coordinate = Coordinate(lat:22.45535149669454,lng:114.06759501584513);
    var converter = Converter(coordinate);
    Coordinate latlng = converter.latLngToGrid();
    print(latlng.x.toString()+ ' '+latlng.y.toString());
    print('x:825021,y:835103');
  });
}
