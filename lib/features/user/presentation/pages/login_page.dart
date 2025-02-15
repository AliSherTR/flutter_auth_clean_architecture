import 'package:flutter/material.dart';
import 'package:user_auth_clean_architecture/core/widgets/app_button.dart';
import 'package:user_auth_clean_architecture/features/onboarding/presentation/widgets/auth_link.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/widgets/form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              CustomFormField(hintText: "Enter Your Email"),
              SizedBox(height: 20),
              CustomFormField(
                hintText: "Enter Your Password",
                isPassword: true,
              ),
              SizedBox(height: 40),
              AppButton(
                text: "Log In",
                onPressed: () {
                  // Handle login logic
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    AuthLink("Sign Up", () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
