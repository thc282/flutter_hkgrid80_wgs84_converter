import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
