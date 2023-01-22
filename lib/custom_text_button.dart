import 'package:flutter/material.dart';
import 'package:gmap/customColor.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor = CustomColors.loginButtonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.blue, fontSize: 18),
      ),
    );
  }
}
