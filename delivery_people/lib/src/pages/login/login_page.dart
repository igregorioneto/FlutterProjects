import 'package:delivery_people/src/store/user/user.store.dart';
import 'package:delivery_people/src/utils/colors.dart';
import 'package:delivery_people/src/wigets/button_custom_widget.dart';
import 'package:delivery_people/src/wigets/button_icon_custom_widget.dart';
import 'package:delivery_people/src/wigets/input_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late UserStore _userStore;

  @override
  void initState() {
    super.initState();
    _userStore = Provider.of<UserStore>(context, listen: false);
  }

  void isObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void clearInputs() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    await _userStore.login(emailController.text, passwordController.text);
    if (_userStore.isLogged) {
      Navigator.of(context).pushNamed('/home');
      clearInputs();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return Observer(
            builder: (_) {
              return AlertDialog(
                title: Text(
                  'E-mail ou Senha inválidos!',
                  style: TextStyle(fontSize: 16),
                ),
                icon: Icon(Icons.close, color: Colors.red,),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }
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
                  controller: emailController,
                ),
                SizedBox(height: 20),
                // Senha
                InputCustomWidget(
                  label: 'Senha',
                  hintText: '******',
                  isPassword: true,
                  obscureText: obscureText,
                  toggleViewPassword: isObscureText,
                  controller: passwordController,
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
                    click: login,
                    isIcon: false,
                  ),
                ),

                // não encontrou a conta
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não tem uma conta?',
                      style: TextStyle(
                        color: AppColors.gray2,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Criar agora',
                        style: TextStyle(
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Entrar com',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(child: Divider(color: AppColors.black))
                  ],
                ),

                SizedBox(height: 16),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ButtonIconCustomWidget(
                    titleButton: 'Continuar com o Google',
                    imageButton: 'assets/images/logo_googleg_48dp.png',
                    borderColor: AppColors.gray3,
                    buttonColor: AppColors.white,
                    titleColor: AppColors.gray2,
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
