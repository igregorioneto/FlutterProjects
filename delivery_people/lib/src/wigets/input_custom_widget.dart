import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class InputCustomWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool? isPassword;
  final VoidCallback toggleViewPassword;
  final bool obscureText;

  InputCustomWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    required this.toggleViewPassword,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
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
