import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:user_auth_clean_architecture/core/app_images.dart';
import 'package:user_auth_clean_architecture/core/widgets/app_button.dart';
import 'package:user_auth_clean_architecture/features/onboarding/presentation/widgets/auth_link.dart';

import 'package:user_auth_clean_architecture/features/user/presentation/bloc/user_bloc.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/signup_page.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/widgets/form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      print("Hi Validation are you working?");
      BlocProvider.of<UserBloc>(context).add(
        UserLoginEvent(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<UserBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: Image.asset(
                      AppImages.onBoardingImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  CustomFormField(
                    hintText: "Enter Your Email",
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomFormField(
                    hintText: "Enter Your Password",
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is UserLoginSuccess) {
                        Navigator.pushReplacementNamed(context, "/home");
                      } else if (state is UserLoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return const CircularProgressIndicator();
                      }
                      return AppButton(
                        text: "Log In",
                        onPressed: (){

                          print("Hello Login");

                        _validateAndLogin();
                        } 
                      );
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
                        AuthLink("Sign Up", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
