import 'package:flutter/material.dart';
import 'package:quick_math/app/enums/shape_type.dart';
import 'package:quick_math/app/util/shape_painter.dart';

class GeometricShapeWidget extends StatelessWidget {
  final ShapeType shapeType;

  GeometricShapeWidget({
    super.key,
    required this.shapeType,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapePainter(shapeType: shapeType),
      child: Container(
        width: 50,
        height: 50,
      ),
    );
  }
}
