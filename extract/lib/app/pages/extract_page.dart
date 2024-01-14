import 'package:extract/app/presenter/themes/colors.dart';
import 'package:extract/app/presenter/widgets/title_result_widget.dart';
import 'package:flutter/material.dart';

class ExtractPage extends StatelessWidget {
  final String type;
  final String from;
  final String value;
  final String date;

  const ExtractPage({
    super.key,
    required this.type,
    required this.from,
    required this.value,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Comprovante',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 10),
                    TitleResultWidget(
                      title: 'Tipo de movimentação',
                      result: type,
                    ),
                    SizedBox(height: 10),
                    TitleResultWidget(
                      title: 'Valor',
                      result: 'R\$ $value',
                    ),
                    SizedBox(height: 10),
                    TitleResultWidget(
                      title: 'Receber',
                      result: from,
                    ),
                    SizedBox(height: 10),
                    TitleResultWidget(
                      title: 'Instituição Bancária',
                      result: 'My Bank',
                    ),
                    SizedBox(height: 10),
                    TitleResultWidget(
                      title: 'Data/Hora',
                      result: date,
                    ),
                    SizedBox(height: 10),
                    TitleResultWidget(
                      title: 'Autenticação',
                      result: '123445345',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: LinearBorder(),
              ),
              child: Text(
                'Compartilhar',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
