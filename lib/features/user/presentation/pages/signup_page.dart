import 'package:flutter/material.dart';
import 'package:user_auth_clean_architecture/core/app_images.dart';
import 'package:user_auth_clean_architecture/core/widgets/app_button.dart';
import 'package:user_auth_clean_architecture/features/onboarding/presentation/widgets/auth_link.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/login_page.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/widgets/form_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: 400,
                child: Image.asset(
                  AppImages.onBoardingImage,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(child: CustomFormField(hintText: "First Name")),
                  SizedBox(width: 20),
                  Expanded(child: CustomFormField(hintText: "Last Name")),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(hintText: "Email"),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                hintText: "Password",
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                hintText: "Confirm Password",
              ),
              SizedBox(
                height: 20,
              ),
              AppButton(text: "Sign Up", onPressed: () {}),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  AuthLink("Sign In", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
