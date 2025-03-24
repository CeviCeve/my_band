part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthToLogin extends AuthEvent {
  final String email;
  final String password;

  AuthToLogin({required this.email, required this.password});
}

class AuthToReg extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String dob;

  AuthToReg({
    required this.email,
    required this.password,
    required this.name,
    required this.dob,
  });
}
