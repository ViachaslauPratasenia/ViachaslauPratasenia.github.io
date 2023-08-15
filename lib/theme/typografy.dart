import 'package:flutter/material.dart';
import 'package:personal_website/theme/colors.dart';
import 'package:personal_website/theme/convention.dart';
import 'package:personal_website/theme/theme.dart';

/// App's font configurations
/// use "${fontWeight}${colorAlteration}${size}" pattern for naming
/// [fontWeight] naming is described here https://docs.microsoft.com/en-us/typography/opentype/spec/os2#usweightclass
/// may be omitted if regular [FontWeight.normal] used
/// [withSize] describes size variation following the convention of [FontSize]
extension Typografy on TextStyle {
  static AppColors get appColors => AppTheme.colors;

  TextStyle withSize(FontSize size) => copyWith(fontSize: StyleConvention.pickFontSize(size));

  TextStyle withLineHeight(FontSize size) => copyWith(height: StyleConvention.pickLineHeight(size));

  TextStyle withWeight(FontWeight fontWeight) => copyWith(
        fontWeight: fontWeight,
        fontFamily: _getFontFamilyByWeight(fontWeight),
      );

  TextStyle withColor(Color color) => copyWith(color: color);

  ///Sizes presets

  TextStyle get extraTiny => withSize(FontSize.extraTiny).withLineHeight(FontSize.extraTiny);

  TextStyle get tiny => withSize(FontSize.tiny).withLineHeight(FontSize.tiny);

  TextStyle get smaller => withSize(FontSize.smaller).withLineHeight(FontSize.smaller);

  TextStyle get small => withSize(FontSize.small).withLineHeight(FontSize.small);

  TextStyle get standard => withSize(FontSize.standard).withLineHeight(FontSize.standard);

  TextStyle get semiLarge => withSize(FontSize.semiLarge).withLineHeight(FontSize.semiLarge);

  TextStyle get large => withSize(FontSize.large).withLineHeight(FontSize.large);

  TextStyle get larger => withSize(FontSize.larger).withLineHeight(FontSize.larger);

  TextStyle get extraLarge => withSize(FontSize.extraLarge).withLineHeight(FontSize.extraLarge);

  TextStyle get huge => withSize(FontSize.huge).withLineHeight(FontSize.huge);

  TextStyle get extraHuge => withSize(FontSize.extraHuge).withLineHeight(FontSize.extraHuge);

  TextStyle get mega => withSize(FontSize.mega).withLineHeight(FontSize.mega);

  TextStyle get extraMega => withSize(FontSize.extraMega).withLineHeight(FontSize.extraMega);

  ///Weight presets

  TextStyle get bold => withWeight(FontWeight.bold);

  TextStyle get semibold => withWeight(FontWeight.w600);

  TextStyle get medium => withWeight(FontWeight.w500);

  TextStyle get regular => withWeight(FontWeight.w400);

  TextStyle get light => withWeight(FontWeight.w300);

  ///Colors presets

  TextStyle get accent => withColor(AppTheme.colors.accent);

  TextStyle get textBase => withColor(AppTheme.colors.textBase);

  String get _fontFamilyName => 'Inter';

  String _getFontFamilyByWeight(FontWeight weight) {
    switch (weight) {
      case FontWeight.bold:
        return '$_fontFamilyName-Bold';
      case FontWeight.normal:
        return '$_fontFamilyName-Regular';
      case FontWeight.w100:
        return '$_fontFamilyName-ExtraLight';
      case FontWeight.w200:
        return '$_fontFamilyName-ExtraLight';
      case FontWeight.w300:
        return '$_fontFamilyName-Light';
      case FontWeight.w500:
        return '$_fontFamilyName-Medium';
      case FontWeight.w600:
        return '$_fontFamilyName-SemiBold';
      case FontWeight.w800:
        return '$_fontFamilyName-ExtraBold';
      case FontWeight.w900:
        return '$_fontFamilyName-Black';
      default:
        return '$_fontFamilyName-Regular';
    }
  }
}
