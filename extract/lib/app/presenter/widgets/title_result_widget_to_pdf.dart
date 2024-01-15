import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:extract/app/presenter/themes/colors.dart';
import 'package:extract/app/presenter/utils/pdf.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class TitleResultWidgetToPdf extends pdfLib.StatelessWidget {
  final String title;
  final String result;
  final pdfLib.Font ttf;

  TitleResultWidgetToPdf({
    Key? key,
    required this.title,
    required this.result,
    required this.ttf,
  }) : super();

  @override
  pdfLib.Widget build(pdfLib.Context context) {
    return pdfLib.Column(
      children: [
        pdfLib.Row(
          children: [
            pdfLib.Text(
              title,
              style: pdfLib.TextStyle(
                font: ttf,
                fontWeight: pdfLib.FontWeight.bold,
                color: PdfColor.fromInt(AppColors.black.value),
                fontSize: 20,
              ),
            ),
          ],
        ),
        pdfLib.SizedBox(height: 5),
        pdfLib.Row(
          children: [
            pdfLib.Text(
              result,
              style: pdfLib.TextStyle(
                font: ttf,
                color: PdfColor.fromInt(AppColors.black.value),
                fontSize: 22,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
