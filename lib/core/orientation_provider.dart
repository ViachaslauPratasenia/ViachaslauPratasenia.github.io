import 'package:flutter/cupertino.dart';
import 'package:personal_website/const/const.dart';

class OrientationProvider {
  final BuildContext context;

  OrientationProvider(this.context);

  OrientationProvider.of(BuildContext context) : this(context);

  Orientation get orientation {
    final size = MediaQuery.sizeOf(context);
    return size.width < Const.config.MAX_LANDSCAPE_WIDTH
        ? Orientation.portrait
        : Orientation.landscape;
  }
}