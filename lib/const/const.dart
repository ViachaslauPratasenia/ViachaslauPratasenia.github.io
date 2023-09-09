// ignore_for_file: non_constant_identifier_names

abstract class Const {
  static const config = _Config();
}

class _Config {
  int get MAX_LANDSCAPE_WIDTH => 980;

  String get CV_URL =>
      'https://raw.githubusercontent.com/ViachaslauPratasenia/files/main/pratasenia_cv.pdf';

  const _Config();
}
