import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_math/app/enums/shape_type.dart';

class ShapePainter extends CustomPainter {
  final ShapeType shapeType;

  ShapePainter({required this.shapeType});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
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

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawTriangle(Canvas canvas, Paint paint, Size size) {
    Path path = Path();
    path.moveTo(size.width / 2.0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  void drawSquare(Canvas canvas, Paint paint, Size size) {
    Rect rect = Rect.fromPoints(Offset(0,0), Offset(size.width, size.height));
    canvas.drawRect(rect, paint);
  }

  void drawCircle(Canvas canvas, Paint paint, Size size) {
    canvas.drawCircle(Offset(size.width / 2.0, size.height / 2), size.width / 2, paint);
  }
}
