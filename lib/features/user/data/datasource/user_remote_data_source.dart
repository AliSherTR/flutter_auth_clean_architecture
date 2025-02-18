import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_auth_clean_architecture/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<String> signUp(String firstName, String lastName, String email,
      String password, String confirmPassword);
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> getMyDetails(String token);
  Future<void> signOut();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Uri url = Uri.parse("https://alladin-ecommerce.koyeb.app/api");

  @override
  Future<UserModel> signIn(String email, String password) async {
    final response = await http.post(
      "$url/auth/login" as Uri,
      body: jsonEncode(
        {
          "email": email,
          "password": password,
        },
      ),
    );

    final data = await jsonDecode(response.body);

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
      "$url/auth/register" as Uri,
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

  @override
  Future<UserModel> getMyDetails(String token) async {
    final response = await http.get(
      "$url/users/me" as Uri,
      headers: {
        "Cookie": "access_token=$token",
      },
    );

    final data = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(data["data"]);
    } else {
      return data["message"];
    }
  }
}
