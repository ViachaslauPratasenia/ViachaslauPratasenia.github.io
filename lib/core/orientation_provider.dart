import 'package:flutter/cupertino.dart';
import 'package:personal_website/const/const.dart';

class OrientationProvider {
  final BuildContext context;

  OrientationProvider(this.context);

  OrientationProvider.of(BuildContext context) : this(context);

  static Orientation orientationOf(BuildContext context) =>
      OrientationProvider.of(context).orientation;

  Orientation get orientation {
    final size = MediaQuery.sizeOf(context);
    return size.width < Const.config.MIN_LANDSCAPE_WIDTH
        ? Orientation.portrait
        : Orientation.landscape;
  }
}
