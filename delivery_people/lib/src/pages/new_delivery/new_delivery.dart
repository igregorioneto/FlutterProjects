import 'package:delivery_people/src/utils/colors.dart';
import 'package:delivery_people/src/wigets/button_custom_widget.dart';
import 'package:delivery_people/src/wigets/text_title_info_custom_widget.dart';
import 'package:delivery_people/src/wigets/text_title_value_custom_widget.dart';
import 'package:flutter/material.dart';

class NewDeliveryPage extends StatefulWidget {
  const NewDeliveryPage({super.key});

  @override
  State<NewDeliveryPage> createState() => _NewDeliveryPageState();
}

class _NewDeliveryPageState extends State<NewDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nova Entrega',
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
              // Tempo estimado e ID
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextTitleValueCustomWidget(
                    title: 'Tempo Estimado',
                    value: '30 min',
                  ),
                  TextTitleValueCustomWidget(
                    title: 'Número de ID',
                    value: '#6789',
                  ),
                ],
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.gray4)),
                ],
              ),

              // Valor da entrega
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTitleValueCustomWidget(
                    title: 'Valor da Entrega',
                    value: 'R\$ 13,75',
                    titleSize: 18,
                    valueSize: 35,
                  ),
                ],
              ),

              // Card Entrega e Rota de entrega
              SizedBox(height: 25),
              Card(
                color: AppColors.gradientColor(0.5),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Entrega',
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        'Percurso Total: 8km',
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                      leading: Icon(
                        Icons.motorcycle_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 34),
                  TextTitleInfoCustomWidget(
                    title: 'Coleta',
                    address: 'Restaurante Recanto da Peixada',
                    distance: 2,
                  ),
                  SizedBox(height: 14),
                  TextTitleInfoCustomWidget(
                    title: 'Entrega',
                    address: 'Av: Cabo dos Soldados - Caranã',
                    distance: 6,
                  ),
                ],
              ),

              // Botões Aceitar e Rejeitar
              SizedBox(height: 36),
              Row(
                children: [
                  Expanded(
                    child: ButtonCustomWidget(
                      buttonColor: AppColors.gradientColor(0.5),
                      borderColor: AppColors.orangeDark,
                      textColor: AppColors.white,
                      titleButton: 'Aceitar',
                      isIcon: true,
                      click: () {},
                      icon: Icons.check,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: ButtonCustomWidget(
                      buttonColor: AppColors.white,
                      borderColor: AppColors.orange,
                      textColor: AppColors.orangeDark,
                      titleButton: 'Rejeitar',
                      isIcon: true,
                      click: () {},
                      icon: Icons.close,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
