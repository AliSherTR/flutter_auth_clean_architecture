import 'package:flutter/material.dart';
import 'package:user_auth_clean_architecture/features/onboarding/presentation/pages/on_boarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  OnBoardingScreen()
    );
  }
}
