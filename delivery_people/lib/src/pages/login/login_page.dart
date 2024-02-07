import 'package:delivery_people/src/wigets/input_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                child: Image.asset('assets/images/pigz-logotipo-branco.png'),
              ),
              SizedBox(height: 8),
              Text(
                'Para Entregadores',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 37),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Email
              InputCustomWidget(
                label: 'Email',
                hintText: 'example@pigz.com.br',
              ),
              SizedBox(height: 20),
              // Senha
              InputCustomWidget(
                label: 'Senha',
                hintText: '******',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
