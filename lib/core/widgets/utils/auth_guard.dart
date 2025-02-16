import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_auth_clean_architecture/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/user_details_screen.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  Future<bool> _isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");
    return token != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isUserLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data == true) {
          return const UserDetailsScreen();
        } else {
          return const OnBoardingScreen();
        }
      },
    );
  }
}
