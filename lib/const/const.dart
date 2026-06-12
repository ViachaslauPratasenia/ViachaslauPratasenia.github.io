// ignore_for_file: non_constant_identifier_names

enum ProfileSource { remote, local }

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

  /// Profile data source, set at build time via:
  ///   --dart-define=PROFILE_SOURCE=local   (use bundled assets/profile.json)
  ///   --dart-define=PROFILE_SOURCE=remote  (default: load from GitHub, asset fallback)
  ProfileSource get PROFILE_SOURCE =>
      const String.fromEnvironment('PROFILE_SOURCE', defaultValue: 'remote') == 'local'
          ? ProfileSource.local
          : ProfileSource.remote;

  const _Config();
}
