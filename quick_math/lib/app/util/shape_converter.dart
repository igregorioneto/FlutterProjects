import 'package:flutter/material.dart';
import 'package:quick_math/app/constants.dart';
import 'package:quick_math/app/enums/shape_type.dart';
import 'package:quick_math/app/widgets/geometric_shape_widget.dart';

class ShapeConverter {
  // Converting Questions in widget
  static List<Widget> replaceShapesInQuestion(String question) {
    List<Widget> widgets = [];

    List<String> lines = question.split('\n');
    for(String line in lines) {
      List<Widget> lineWidgets = [];
      List<String> tokens = line.split(' ');

      for (String token in tokens) {
        Widget? widget = _getShapeWidget(token);
        if (widget != null) {
          lineWidgets.add(widget);
        } else {
          if (double.tryParse(token) != null) {
            double parsedValue = double.parse(token);
            String formattedToken = parsedValue.toStringAsFixed(2);
            lineWidgets.add(Text(formattedToken, style: whiteText));
          } else {
            lineWidgets.add(Text(token, style: whiteText));
          }
        }
        lineWidgets.add(SizedBox(width: 10));
      }
      widgets.add(Row(mainAxisAlignment: MainAxisAlignment.center,children: lineWidgets));
      widgets.add(SizedBox(height: 10));
    }
    return widgets;
  }

  // Converting shape geometric in Widget
  static Widget? _getShapeWidget(String shapeToken) {
    Map<String, dynamic> shapeMappings = {
      'q': GeometricShapeWidget(shapeType: ShapeType.square),
      't': GeometricShapeWidget(shapeType: ShapeType.triangle),
      'c': GeometricShapeWidget(shapeType: ShapeType.circle),
    };

    return shapeMappings[shapeToken];
  }
}