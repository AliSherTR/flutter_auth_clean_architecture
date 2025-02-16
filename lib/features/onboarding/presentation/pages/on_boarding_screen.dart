import 'package:flutter/material.dart';
import 'package:user_auth_clean_architecture/core/app_images.dart';
import 'package:user_auth_clean_architecture/core/widgets/app_button.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/login_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25 , right: 25),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(AppImages.onBoardingImage),
            ),
            SizedBox(
              height: 100,
            ),
            AppButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
