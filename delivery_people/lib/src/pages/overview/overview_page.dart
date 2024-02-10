import 'package:delivery_people/src/utils/colors.dart';
import 'package:delivery_people/src/wigets/button_simple_icon_custom_widget.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  double _grandientValue = 0.5;
  bool _isVisibledValue = true;

  void visibledValue() {
    setState(() {
      _isVisibledValue = !_isVisibledValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visão Geral',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: AppColors.orange),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          children: [
            Card(
              color: AppColors.gradientColor(_grandientValue),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      'Ganhos do dia',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          fontFamily: 'Poppins'),
                    ),
                    trailing: Text(
                      '29/07',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _isVisibledValue
                            ? Text(
                                'R\$ 150',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    fontFamily: 'Poppins'),
                              )
                            : Container(
                                color: AppColors.white,
                                width: 100,
                                height: 5,
                              ),
                        ButtonSimpleIconCustomWidget(
                          click: visibledValue,
                          icon: _isVisibledValue
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            SizedBox(height: 32),

            // Card Resumo das entregas
            Card(
              color: AppColors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Resumo das Entregas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.gray3,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Aceitas',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              '15',
                              style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Card Iniciar nova entrega
          ],
        ),
      ),
    );
  }
}
