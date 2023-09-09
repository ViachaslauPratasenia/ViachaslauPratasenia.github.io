// ignore_for_file: non_constant_identifier_names

abstract class Const {
  static const config = _Config();
}

class _Config {
  int get MAX_LANDSCAPE_WIDTH => 980;

  String get CV_URL =>
      'https://docs.google.com/document/d/16D2S9KBcGuMM6ej1y2j4Z4S4sU0KdbtoldYLCIwX1bc/edit?usp=sharing';

  const _Config();
}
