# flutter_hkgrid80_wgs84_converter

This package allows you to convert WGS 84 Latitude and Longitude to Hong Kong Grid 1980 Easting and Northing.

## Usage
Add this repository to `pubspec.yaml`.

Example: 
```dart
dependencies:
    flutter:
        sdk: flutter
    flutter_hkgrid80_wgs84_converter:
        git: 
            url: https://github.com/lowkahonn/flutter_hkgrid80_wgs84_converter.git
            ref: master
```

Import `package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart`, and use `Converter.convert` to convert between the two systems.

Note: This converter is up to 1e-5% error.

Example:
```dart
import 'package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart';

final coordinate = new Coordinate(
    x: 834349.252, 
    y: 815894.556,
    lat: 22.281927, 
    lng: 114.158256
);

// from x y to lat long
Coordinate latLng = Converter.convert.gridToLatLng(coordinate);
print(latLng.lat.toString()); // 22.281930012478536 
print(latLng.lng.toString()); // 114.15824821181121

// from lat long to x y
Coordinate xy = Converter.convert.latLngToGrid(coordinate);
print(xy.x.toString()); // 834350.1488648592
print(xy.y.toString()); // 815894.2762260285
```
