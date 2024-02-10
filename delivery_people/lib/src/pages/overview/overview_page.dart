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
        title: Text('Visão Geral'),
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
                      ),
                    ),
                    trailing: Text(
                      '29/07',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
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
                                ),
                              )
                            : Container(
                                color: AppColors.white,
                                width: 100,
                                height: 5,
                              ),
                        ButtonSimpleIconCustomWidget(
                          click: visibledValue,
                          icon: _isVisibledValue ? Icons.visibility_off : Icons.visibility,
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
          ],
        ),
      ),
    );
  }
}
