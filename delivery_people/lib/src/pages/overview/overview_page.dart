import 'package:delivery_people/src/pages/new_delivery/new_delivery.dart';
import 'package:delivery_people/src/utils/colors.dart';
import 'package:delivery_people/src/wigets/button_custom_widget.dart';
import 'package:delivery_people/src/wigets/button_simple_icon_custom_widget.dart';
import 'package:delivery_people/src/wigets/card_custom_widgets.dart';
import 'package:delivery_people/src/wigets/card_simple_title_value_widget.dart';
import 'package:delivery_people/src/wigets/input_custom_widget.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  TextEditingController deliveryController = TextEditingController();
  double _grandientValue = 0.5;
  bool _isVisibledValue = true;

  void visibledValue() {
    setState(() {
      _isVisibledValue = !_isVisibledValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => FocusScope.of(context).unfocus());
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
      body: SingleChildScrollView(
        child: Padding(
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

              SizedBox(height: 20),

              // Card Resumo das entregas
              CardCustomWidget(
                title: 'Resumo das Entregas',
                customWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardSimpleTitleValueWidget(
                      title: 'Aceitas',
                      value: '15',
                    ),
                    CardSimpleTitleValueWidget(
                      title: 'Rejeitadas',
                      value: '5',
                    ),
                    CardSimpleTitleValueWidget(
                      title: 'Total',
                      value: '20',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              // Card Iniciar nova entrega
              CardCustomWidget(
                title: 'Iniciar Nova Entrega',
                customWidget: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Flexible(
                            child: InputCustomWidget(
                              label: 'Número de identificação',
                              hintText: '123456',
                              toggleViewPassword: () {},
                              obscureText: false,
                              controller: deliveryController,
                            ),
                          ),
                          SizedBox(width: 8),
                          ButtonCustomWidget(
                            buttonColor: AppColors.orangeDark,
                            borderColor: AppColors.orangeLight,
                            textColor: AppColors.white,
                            titleButton: 'OK',
                            isIcon: false,
                            click: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NewDeliveryPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonCustomWidget(
                              buttonColor: AppColors.gradientColor(0.5),
                              borderColor: AppColors.orangeDark,
                              textColor: AppColors.white,
                              titleButton: 'Escanear Qrcode',
                              isIcon: true,
                              icon: Icons.qr_code,
                              click: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
