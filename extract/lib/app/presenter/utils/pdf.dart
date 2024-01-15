import 'dart:io';
import 'dart:typed_data';

import 'package:extract/app/presenter/themes/colors.dart';
import 'package:extract/app/presenter/widgets/title_result_widget_to_pdf.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:google_fonts/google_fonts.dart';

class PDF {

  static Future<pdfLib.Font> loadFont() async {
    final ByteData data = await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
    return pdfLib.Font.ttf(data);
  }

  static Future<void> generatePdf({
    String type = '',
    String from = '',
    String value = '',
    String date = '',
  }) async {
    // final Uint8List data = File('assets/fonts/NotoSans-Regular.ttf').readAsBytesSync();
    // final ttf = pdfLib.Font.ttf(data.buffer.asByteData());
    final pdfLib.Font ttf = await loadFont();

    final pdf = pdfLib.Document();

    pdf.addPage(
      pdfLib.Page(pageFormat: PdfPageFormat.a4,build: (context) {
        return pdfLib.Column(
          children: [
            pdfLib.Row(
              mainAxisAlignment: pdfLib.MainAxisAlignment.center,
              children: [
                pdfLib.Text(
                  'Comprovante',
                  style: pdfLib.TextStyle(
                    font: ttf,
                    fontWeight: pdfLib.FontWeight.bold,
                    color: PdfColor.fromInt(AppColors.black.value),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            pdfLib.SizedBox(height: 5),
            pdfLib.Divider(),
            pdfLib.SizedBox(height: 10),
            TitleResultWidgetToPdf(
              title: 'Tipo de movimentação',
              result: type,
              ttf: ttf,
            ),
            pdfLib.SizedBox(height: 10),
            TitleResultWidgetToPdf(
              title: 'Valor',
              result: 'R\$ $value',
              ttf: ttf,
            ),
            pdfLib.SizedBox(height: 10),
            TitleResultWidgetToPdf(
              title: 'Receber',
              result: from,
              ttf: ttf,
            ),
            pdfLib.SizedBox(height: 10),
            TitleResultWidgetToPdf(
              title: 'Instituição Bancária',
              result: 'My Bank',
              ttf: ttf,
            ),
            pdfLib.SizedBox(height: 10),
            TitleResultWidgetToPdf(
              title: 'Data/Hora',
              result: date,
              ttf: ttf,
            ),
            pdfLib.SizedBox(height: 10),
            TitleResultWidgetToPdf(
              title: 'Autenticação',
              result: '123445345',
              ttf: ttf,
            ),
          ],
        );
      }),
    );

    try {
      final file = File('${Directory.systemTemp.path}/comprovante.pdf');
      await file.writeAsBytes(await pdf.save());
      print('PDF salvo com sucesso em ${file.path}');
    } catch (e) {
      print('Erro ao salvar o PDF: $e');
    }
  }
}
