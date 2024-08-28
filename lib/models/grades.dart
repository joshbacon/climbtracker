import 'package:climb_tracker/models/session.dart';

double avgGreen  = -1.0;
double avgYellow =  0.5;
double avgOrange =  2.5;
double avgBlue   =  4.5;
double avgRed    =  6.5;
double avgPurple =  8.5;
double avgPink   = 10.0;
double avgGrey   =  5.0;

String getSessionAverage(Session session) {

  double newAverage = sumRouteGrades(session) / sumNumRoutes(session);

  if (newAverage < 0.0) {
    return 'VB';
  } else {
    return 'V${newAverage.round()}';
  }
}

String getTotalAverage(List<Session> sessions) {

  int numRoutes = 0;
  double gradeTotal = 0.0;

  for (Session s in sessions) {
    numRoutes += sumNumRoutes(s);
    gradeTotal += sumRouteGrades(s);
  }

  double newAverage = gradeTotal / numRoutes;

  if (newAverage < 0.0) {
    return 'VB';
  } else {
    return 'V${newAverage.round()}';
  }
}

int sumNumRoutes(Session session) {
  int numRoutes = 0;
  numRoutes += session.getGreen();
  numRoutes += session.getYellow();
  numRoutes += session.getOrange();
  numRoutes += session.getBlue();
  numRoutes += session.getRed();
  numRoutes += session.getPurple();
  numRoutes += session.getPink();
  numRoutes += session.getGrey();
  
  return numRoutes;
}

double sumRouteGrades(Session session) {
  double gradeTotal = 0.0;
  gradeTotal += avgYellow * session.getYellow();
  gradeTotal += avgOrange * session.getOrange();
  gradeTotal += avgBlue   * session.getBlue();
  gradeTotal += avgRed    * session.getRed();
  gradeTotal += avgPurple * session.getPurple();
  gradeTotal += avgPink   * session.getPink();
  gradeTotal += avgGrey   * session.getGrey();
  
  return gradeTotal;
}