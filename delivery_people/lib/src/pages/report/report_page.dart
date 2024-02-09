import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: AppColors.orange),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
