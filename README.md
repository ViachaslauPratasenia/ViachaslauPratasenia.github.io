# Viachaslau Pratasenia personal website

## Created with Flutter

## Profile data source

The site loads profile data from a remote JSON by default, falling back to the
bundled `assets/profile.json`. To run against the local asset only:

    flutter run --dart-define=PROFILE_SOURCE=local

Omit the define (or pass `=remote`) for the default cloud behavior.
