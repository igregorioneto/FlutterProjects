import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_math/app/enums/shape_type.dart';

class ShapePainter extends CustomPainter {
  // Shape Geometric Type
  final ShapeType shapeType;

  ShapePainter({required this.shapeType});

  // Paint Geometric Shape
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.lightBlueAccent;
    switch (shapeType) {
      case ShapeType.triangle:
        drawTriangle(canvas, paint, size);
        break;
      case ShapeType.square:
        drawSquare(canvas, paint, size);
        break;
      case ShapeType.circle:
        drawCircle(canvas, paint, size);
        break;
      default:
        throw Exception('Chosen geometric shape does not exists!');
    }
  }

  //It's not for drawing
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  // Draw Triangle
  void drawTriangle(Canvas canvas, Paint paint, Size size) {
    Path path = Path();
    path.moveTo(size.width / 2.0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  // Draw Square
  void drawSquare(Canvas canvas, Paint paint, Size size) {
    Rect rect = Rect.fromPoints(Offset(0,0), Offset(size.width, size.height));
    canvas.drawRect(rect, paint);
  }

  // Draw Circle
  void drawCircle(Canvas canvas, Paint paint, Size size) {
    canvas.drawCircle(Offset(size.width / 2.0, size.height / 2), size.width / 2, paint);
  }
}
