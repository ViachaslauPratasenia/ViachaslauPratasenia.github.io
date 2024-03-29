// ignore_for_file: non_constant_identifier_names

abstract class Const {
  static const config = _Config();
}

class _Config {
  int get MIN_LANDSCAPE_WIDTH => 900;

  int get MAX_LANDSCAPE_WIDTH => 1140;

  String get GITHUB_URL => 'https://raw.githubusercontent.com/ViachaslauPratasenia/files/main/';

  String get CV_URL => 'https://pratasenia.dev/resume.pdf';

  String get PROFILE_URL =>
      'https://raw.githubusercontent.com/ViachaslauPratasenia/files/main/profile.json';

  const _Config();
}
