import 'package:flutter/cupertino.dart';
import 'package:personal_website/core/orientation_provider.dart';

class BaseBlock extends StatelessWidget {
  final Widget child;
  final double? horizontalPadding;
  final double? verticalPadding;

  const BaseBlock({super.key, required this.child, this.horizontalPadding, this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    final defaultHorizontalPadding = orientation == Orientation.landscape ? 48.0 : 24.0;
    final defaultVerticalPadding = orientation == Orientation.landscape ? 96.0 : 48.0;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? defaultHorizontalPadding,
        vertical: verticalPadding ?? defaultVerticalPadding,
      ),
      child: child,
    );
  }
}
