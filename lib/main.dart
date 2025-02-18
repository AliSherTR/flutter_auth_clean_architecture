import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_auth_clean_architecture/core/widgets/utils/auth_guard.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/bloc/user_bloc.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/login_page.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/pages/signup_page.dart';
import 'package:user_auth_clean_architecture/features/user/user_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initUserDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<UserBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthGuard(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignupPage(),
        },
      ),
    );
  }
}
