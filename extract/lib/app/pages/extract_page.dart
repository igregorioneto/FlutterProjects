import 'package:extract/app/presenter/themes/colors.dart';
import 'package:flutter/material.dart';

class ExtractPage extends StatelessWidget {
  final String type;
  const ExtractPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comprovante',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Text('Comprovante $type'),
        ],
      ),
    );
  }
}
