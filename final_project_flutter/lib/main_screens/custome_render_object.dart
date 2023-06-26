import 'package:flutter/material.dart';

class ShirtWidget extends LeafRenderObjectWidget {
  final Color color;
  const ShirtWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _ShirtRenderBox(color: color);
  }

  @override
  void updateRenderObject(
      BuildContext context,   _ShirtRenderBox renderObject) {
    renderObject.color = color;
  }
}

class _ShirtRenderBox extends RenderBox {
  Color _color;

  Color get color => _color;

  set color(Color value) {
    if (value == color) return;
    _color = color;
    markNeedsPaint();
  }

  _ShirtRenderBox({required Color color}) : _color = color;

  @override
  bool get sizedByParent => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // DRAWiNG THE BACKGROUND
    canvas.drawCircle(( Offset(  (offset&size).center.dx+89,(offset&size).center.dy)) , 89,Paint()..color = color);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return const Size(45, 233);
  }
}