import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class InputCustomWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool? isPassword;
  final VoidCallback toggleViewPassword;
  final bool obscureText;
  final TextEditingController controller;

  InputCustomWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    required this.toggleViewPassword,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Este campo é obrigatório';
        } else if (value!.length < 6) {
          return 'Valor mínimo é de 6 dígitos';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.orange),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.orangeDark),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        suffixIcon: isPassword == true
            ? IconButton(
                onPressed: toggleViewPassword,
                icon: Icon( obscureText == true ? Icons.visibility : Icons.visibility_off),
              ) : Column(),
        suffixIconColor: AppColors.orangeDark,
        label: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
