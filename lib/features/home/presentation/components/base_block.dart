import 'package:flutter/cupertino.dart';

class BaseBlock extends StatelessWidget {
  final Widget child;
  final double? horizontalPadding;
  final double? verticalPadding;

  const BaseBlock({super.key, required this.child, this.horizontalPadding, this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 80,
        vertical: verticalPadding ?? 96,
      ),
      child: child,
    );
  }
}
