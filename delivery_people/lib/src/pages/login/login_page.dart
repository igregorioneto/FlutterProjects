import 'package:delivery_people/src/utils/colors.dart';
import 'package:delivery_people/src/wigets/button_custom_widget.dart';
import 'package:delivery_people/src/wigets/input_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  void isObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  obscureText: false,
                  toggleViewPassword: () {},
                ),
                SizedBox(height: 20),
                // Senha
                InputCustomWidget(
                  label: 'Senha',
                  hintText: '******',
                  isPassword: true,
                  obscureText: obscureText,
                  toggleViewPassword: isObscureText,
                ),
        
                SizedBox(height: 16),
                // esqueci a senha
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: AppColors.gray2,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 16),
                // Button entrar
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ButtonCustomWidget(
                    borderColor: AppColors.orange,
                    buttonColor: AppColors.orangeDark,
                    textColor: AppColors.white,
                    titleButton: 'Entrar',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
