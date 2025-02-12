import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_auth_clean_architecture/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<String> signUp(String firstName, String lastName, String email,
      String password, String confirmPassword);
  Future<UserModel> signIn(String email, String password);
  Future<void> signOut();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Uri url = Uri.parse("https://alladin-ecommerce.koyeb.app/api/auth");

  @override
  Future<UserModel> signIn(String email, String password) async {
    final response = await http.post(
      "$url/login" as Uri,
      body: jsonEncode(
        {
          "email": email,
          "password": password,
        },
      ),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(data['data']);
    } else {
      return data["message"];
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<String> signUp(String firstName, String lastName, String email,
      String password, String confirmPassword) async {
    final response = await http.post(
      "$url/register" as Uri,
      body: jsonEncode(
        {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      ),
    );

    final dynamic data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["message"];
    } else {
      throw Exception(data['message'] ?? "Something went wrong!");
    }
  }
}
