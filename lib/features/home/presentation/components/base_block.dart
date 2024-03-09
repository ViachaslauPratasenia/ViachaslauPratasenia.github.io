import 'package:flutter/cupertino.dart';

class BaseBlock extends StatelessWidget {
  final Widget child;

  const BaseBlock({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 96),
      child: child,
    );
  }
}
