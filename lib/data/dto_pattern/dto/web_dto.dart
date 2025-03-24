import 'dart:developer';

import 'package:pocketbase/pocketbase.dart';

class WebDto {
  final pb = PocketBase('http://127.0.0.1:8090');

  Future<Map<String, dynamic>> registration({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    required String dob,
    required String userCode,
  }) async {
    if (name.isEmpty ||
        email.isEmpty ||
        dob.isEmpty ||
        password.isEmpty ||
        passwordConfirm.isEmpty ||
        userCode.isEmpty) {
      return {'error': 'All fields must be provided and non-empty.'};
    }

    try {
      final body = {
        'name': name,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'userCode': userCode,
        'dob': dob,
      };

      final response = await pb.collection('users').create(body: body);
      return response.data;
    } catch (e) {
      return {"error": e};
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      // Аутентификация через PocketBase
      final authData = await pb
          .collection('users')
          .authWithPassword(email, password);
      // Возвращаем токен и данные пользователя
      return {'token': authData.token, 'user': authData.record.data};
    } catch (e) {
      // Возвращаем ошибку в случае неудачи
      return {"error": e};
    }
  }
}

void main() async {
  WebDto dto = WebDto();
  try {
    final userData = await dto.login(
      email: "john@examplle.com",
      password: "tBMLpWU8hcHQ_Yi",
    );
    log('Registered user: ${userData['token']}, ${userData['user']}');
  } catch (e) {
    log(e.toString());
  }
}
