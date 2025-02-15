import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          textStyle: TextStyle(fontSize: 16),
          backgroundColor: Colors.amber,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black26,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
