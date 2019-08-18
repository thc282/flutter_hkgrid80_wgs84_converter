# flutter_hkgrid80_wgs84_converter

This package allows you to convert WGS 84 Latitude and Longitude to Hong Kong Grid 1980 Easting and Northing.

## Usage
Add this repository to `pubspec.yaml`.

Example: 
```
dependencies:
    flutter:
        sdk: flutter
    flutter_hkgrid80_wgs84_converter:
        git: 
            url: git://github.com/lowkahonn/flutter_hkgrid80_wgs84_converter
            ref: e5e4e36
```

Import `package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart`, and use `Converter.convert` to convert between the two systems.

Note: This converter is up to 1e-5% error.

Example:
```
import 'package:flutter_hkgrid80_wgs84_converter/flutter_hkgrid80_wgs84_converter.dart';

// from hkgrid
Coordinate coordinate = Converter.convert.gridToLatLng(834349.252,815894.556);
print(latLng.lat.toString()); // 22.281930012478536 
print(latLng.lng.toString()); // 114.15824821181121

// from lat long
Coordinate xy = Converter.convert.latLngToGrid(22.281927, 114.158256);
print(xy.x.toString()); // 834350.1488648592
print(xy.y.toString()); // 815894.2762260285
```
