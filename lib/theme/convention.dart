/// set of strict rules that are affecting UI colors and sizes
class StyleConvention {
  /// font size mapping for local naming convention
  static const Map<FontSize, double> fontSizes = {
    FontSize.extraTiny: 8.0,
    FontSize.tiny: 10.0,
    FontSize.smaller: 12.0,
    FontSize.small: 14.0,
    FontSize.standard: 16.0,
    FontSize.semiLarge: 17.0,
    FontSize.large: 18.0,
    FontSize.larger: 20.0,
    FontSize.extraLarge: 22.0,
    FontSize.huge: 24.0,
    FontSize.extraHuge: 26.0,
    FontSize.mega: 34.0,
    FontSize.extraMega: 40.0,
  };

  static const Map<FontSize, double> lineHeights = {
    FontSize.extraTiny: 1.4,
    FontSize.tiny: 1.4,
    FontSize.smaller: 1.4,
    FontSize.small: 1.4,
    FontSize.standard: 1.4,
    FontSize.semiLarge: 1.6,
    FontSize.large: 1.7778,
    FontSize.larger: 1.7778,
    FontSize.extraLarge: 1.4545,
    FontSize.huge: 1.3,
    FontSize.extraHuge: 1.2308,
    FontSize.mega: 1.4118,
    FontSize.extraMega: 1.3,
  };

  static double pickFontSize(FontSize size) => fontSizes[size]!;

  static double pickLineHeight(FontSize size) => lineHeights[size]!;
}

enum FontSize {
  extraTiny,
  tiny,
  smaller,
  small,
  standard,
  semiLarge,
  large,
  larger,
  extraLarge,
  huge,
  extraHuge,
  mega,
  extraMega,
}

