import 'package:flutter/material.dart';
import 'package:user_auth_clean_architecture/core/app_images.dart';
import 'package:user_auth_clean_architecture/core/widgets/app_button.dart';
import 'package:user_auth_clean_architecture/features/onboarding/presentation/widgets/auth_link.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/login_page.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/widgets/form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateAndSignUP() {
    if (_formKey.currentState!.validate()) {
      print(
          "Signing Up with: ${_emailController.text}, ${_passwordController.text}, ${_firstNameController.text}, ${_lastNameController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                    Expanded(
                      child: CustomFormField(
                        hintText: "First Name",
                        controller: _firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "First name is required";
                          if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                            return "Only letters are allowed";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: CustomFormField(
                      hintText: "Last Name",
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Last Name is required";
                        }
                        if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                          return "Only letters are allowed";
                        }
                        return null;
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  hintText: "Email",
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  hintText: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return "Password must be atleast 7 characters";
                    }
                    return null;
                  },
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  hintText: "Confirm Password",
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                    text: "Sign Up",
                    onPressed: () {
                      _validateAndSignUP();
                    }),
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
      ),
    );
  }
}
