import 'dart:convert';

class Session {
  String date = "05-09-2023";
  int green = 0;
  int yellow = 0;
  int orange = 0;
  int blue = 0;
  int red = 0;
  int purple = 0;
  int pink = 0;
  int grey = 0;

  Session(this.date);

  Session.fromString(String key, String data) {
    date = key;
    var tokens = jsonDecode(data);
    green = tokens['green'] ?? 0;
    yellow = tokens['yellow'] ?? 0;
    orange = tokens['orange'] ?? 0;
    blue = tokens['blue'] ?? 0;
    red = tokens['red'] ?? 0;
    purple = tokens['purple'] ?? 0;
    pink = tokens['pink'] ?? 0;
    grey = tokens['grey'] ?? 0;
  }

  @override
  String toString() {
    return jsonEncode({
      'green': green,
      'yellow': yellow,
      'orange': orange,
      'blue': blue,
      'red': red,
      'purple': purple,
      'pink': pink,
      'grey': grey
    });
  }

  String getDate() {
    return date;
  }

  int getGreen() { return green; }
  void addGreen() { green += 1; }
  void removeGreen() { if (green > 0) yellow -= 1; }

  int getYellow() { return yellow; }
  void addYellow() { yellow += 1; }
  void removeYellow() { if (yellow > 0) yellow -= 1; }

  int getOrange() { return orange; }
  void addOrange() { orange += 1; }
  void removeOrange() { if (orange > 0) orange -= 1; }

  int getBlue() { return blue; }
  void addBlue() { blue += 1; }
  void removeBlue() { if (blue > 0) blue -= 1; }
  
  int getRed() { return red; }
  void addRed() { red += 1; }
  void removeRed() { if (red > 0) red -= 1; }
  
  int getPurple() { return purple; }
  void addPurple() { purple += 1; }
  void removePurple() { if (purple > 0) purple -= 1; }
  
  int getPink() { return pink; }
  void addPink() { pink += 1; }
  void removePink() { if (pink > 0) purple -= 1; }
  
  int getGrey() { return grey; }
  void addGrey() { grey += 1; }
  void removeGrey() { if (grey > 0) purple -= 1; }
}