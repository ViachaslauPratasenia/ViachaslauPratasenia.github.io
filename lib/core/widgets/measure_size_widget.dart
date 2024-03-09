import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//ignore: prefer_generic_function_type_aliases
typedef void OnWidgetSizeChange(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSizeWidget extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSizeWidget({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(
      BuildContext context,
      covariant MeasureSizeRenderObject renderObject,
      ) {
    renderObject.onChange = onChange;
  }
}
