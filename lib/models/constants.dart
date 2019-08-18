import 'dart:math';

// constants
const double a = 6378388; // semi-major axis of reference ellipsoid
const double N_0 = 819069.80; // northing of projection origin 
const double E_0 = 836694.05; // easting of projection origin
const double e_squared = 6.722670022e-3; // first eccentricity of reference ellipsoid
const double m_0 = 1; // scale factor
const double phi_0 = (22 + 18/60 + 43.68/3600) * pi / 180; // DMS to radian, lat of projection origin
const double lambda_0 = (114 + 10/60 + 42.80/3600) * pi / 180; // DMS to decimal, lng of projection origin
const double M_0 = 2468395.728; // meridian distance measured from equator to origin
final double psi_s = v_s / p_s; // isometric latitude
final double A_0 = 1 - e_squared/4 - (3/64) * e_quad;
final double A_2 = (3/8) * (e_squared + (1/4) * e_quad);
final double A_4 = (15/256) * e_quad;
final double e_quad = pow(e_squared,2);
final double v_s = a / sqrt((1 - e_squared * pow(sin(phi_0),2))); // radius of curvature in the prime vertical
final double p_s = a * (1 - e_squared) / pow(sqrt(1 - e_squared * pow(sin(phi_0),2)),3); // radius of curvature in the meridian

class Constants {
  
  static double meridianDistance(phi) {
    return a * ((A_0 * phi) - (A_2 * sin(2 * phi)) + (A_4 * sin(4 * phi)));
  }

  static double derivativeM(phi) {
    return a * (A_0 - A_2 * 2 * cos(2*phi) + 4 * A_4 * cos(4*phi));
  }

  static getPhiP(N) {
    // newton method
    // f(x) = meridianDistance(x) - M
    // f'(x) = a * (A_0 - A_2 * 2 * cos(2*x) + 4 * A_4 * cos(4*x))
    double deltaN = N - N_0;
    double c = (deltaN + M_0) / m_0;
    double error = pow(10,-17);
    double err = 1; // initialize
    double x0 = 0.3;
    // double x1 = 0.4;
    double x;
    double xn = x0;
    double fxn;
    int i = 1;
    int maxIteration = 500;    
    // double fx0;
    // double fx1;
    // double dx;
    // int i = 2;
    // while(err > error) {
    //   fx0 = meridianDistance(x0) - c;
    //   fx1 = meridianDistance(x1) - c;
    //   x = x1 - (x1 - x0) * fx1 / (fx1 - fx0);
    //   x0 = x1;
    //   x1 = x;
    //   err = (x0-x1).abs();
    //   print("x" + i.toString() + " = " + x.toString() + ', error: ' + err.toString());
    //   i ++;
    // }
    while(err>error && i<maxIteration) {
      fxn = meridianDistance(xn) - c;
      xn = xn - fxn/derivativeM(xn);
      err = fxn.abs();
      // x0 = x;
      // print("x"+i.toString()+" = "+xn.toString()+', error: '+err.toString());
      // i++;
    }
    return xn;
  }
  
  static double getV(phi) {
    return a / sqrt(1-(e_squared*pow(sin(phi),2)));
  }

  static double getRoll(phi) {
    return a*(1 - e_squared)/pow(sqrt(1-e_squared*pow(sin(phi),2)),3);
  }

  static Map getAllConstants(x,y) {
    var constants = new Map();
    // [phiP, vP, rollP, psiP, tanP, deltaE, deltaN]
    double phiP = getPhiP(y);
    double secantPhiP = 1 / cos(phiP);
    double vP = getV(phiP);
    double rollP = getRoll(phiP);
    double psiP = vP / rollP;
    double tanP = tan(phiP);
    double deltaE = x - E_0;
    double deltaN = y - N_0;
    constants['phiP'] = phiP;
    constants['secantPhiP'] = secantPhiP;
    constants['vP'] = vP;
    constants['rollP'] = rollP;
    constants['psiP'] = psiP;
    constants['tanP'] = tanP;
    constants['deltaE'] = deltaE;
    constants['deltaN'] = deltaN;
    return constants;
  }
}