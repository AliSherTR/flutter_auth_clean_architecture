import 'package:flutter/material.dart';

Widget AuthLink(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyle(color: Colors.blue, fontSize: 20),
    ),
  );
}
