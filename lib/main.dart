import 'package:flutter/material.dart';
import 'package:user_auth_clean_architecture/core/widgets/utils/auth_guard.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/login_page.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGuard(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
