import 'package:extract/app/presenter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBalance = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Extrato',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height * 0.18,
              height: 140,
              color: AppColors.gray2,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Seu Saldo',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isBalance = !_isBalance;
                            });
                          },
                          icon: Icon(
                            !_isBalance
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  !_isBalance
                      ? Divider(
                          color: AppColors.blue,
                          height: 28,
                          thickness: 3,
                          indent: 0,
                          endIndent: 200,
                        )
                      : Text(
                          'R\$ 1.350,00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue,
                            fontSize: 24,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Sua movimentações',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ListTile(
                  tileColor: AppColors.gray2,
                  title: Text('Transferência enviada'),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('David Bond'),
                          Text('13/10'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('R\$ 18,00'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
