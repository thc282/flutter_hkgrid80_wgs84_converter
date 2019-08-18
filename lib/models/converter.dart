import 'dart:math';
import 'package:flutter_hkgrid80_wgs84_converter/models/coordinate.dart';
import 'package:flutter_hkgrid80_wgs84_converter/models/constants.dart';

class Conversion {

  double xToLng(Map constants) {
    return lng_0 + constants['secantPhiP'] * (constants['deltaE']) / (m_0 * constants['vP'])
      - constants['secantPhiP'] * (pow(constants['deltaE'],3) * (constants['psiP']+2*pow(constants['tanP'],2)) / (6*pow(m_0*constants['vP'],3)) );
  }

  double yToLat(Map constants) {
    return constants['phiP'] - constants['tanP'] * pow(constants['deltaE'],2) / (m_0 * constants['rollP'] * 2 * m_0 * constants['vP']);
  }

  double latToY(lat,lng) {
    double latRadian = lat * pi / 180;
    double deltaLng = lng * pi / 180 - lng_0;
    return N_0 + m_0 * (Constants.meridianDistance(latRadian)-M_0 + v_s*sin(latRadian)*pow(deltaLng,2)/2*cos(latRadian));
  }

  double lngToX(lat,lng) {
    double latRadian = lat * pi / 180;
    double deltaLng = lng * pi / 180 - lng_0;
    return E_0 + m_0 * (v_s * deltaLng * cos(latRadian) + v_s * pow(deltaLng,3) / 6 * pow(cos(latRadian),3) * (psi_s - tan(latRadian)));
  }

  Coordinate gridToLatLng(Coordinate coordinate) {
    assert(coordinate.x != null && coordinate.y != null);
    var constants = Constants.getAllConstants(coordinate.x, coordinate.y, system.grid);     // [phiP, vP, rollP, psiP, tanP, deltaE, deltaN]
    double lat = yToLat(constants);
    double lng = xToLng(constants);
    return Coordinate(
      lat: lat*180/pi - 5.5/3600,
      lng: lng*180/pi + 8.8/3600
    );
  }

  Coordinate latLngToGrid(Coordinate coordinate) {
    assert(coordinate.lat != null && coordinate.lng != null);
    Constants.initAllConstants(system.wgs);
    double lat = coordinate.lat + 5.5/3600;
    double lng = coordinate.lng - 8.8/3600;
    double x = lngToX(lat,lng);
    double y = latToY(lat,lng);
    return Coordinate(
      x: x,
      y: y,
    );
  }
}
