import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/ui/activity/registration_screen.dart';
import 'package:my_band/ui/element/custom/custom_blue_button.dart';
import 'package:my_band/ui/element/custom/custom_textfield.dart';

const Color kActiveButtonColor = Color.fromARGB(255, 21, 21, 185);
const Color kInactiveButtonColor = Color.fromARGB(100, 25, 25, 229);
const Color kBackgroundColor = Color.fromARGB(255, 18, 18, 23);
const Color kBorderColor = Color.fromARGB(112, 21, 21, 185);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  bool get _isStepValid {
    final isValid =
        _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(_emailController.text) &&
        _passwordController.text.length >= 8;
    //log(isValid.toString());
    //log(      "Second step valid: $isValid, Email: ${_emailController.text}, Password: ${_passwordController.text}, Length: ${_passwordController.text.length}",);
    return isValid;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 20),
              child: Text(
                "Вход",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  shadows: <Shadow>[
                    Shadow(color: Colors.white, blurRadius: 20),
                  ],
                ),
              ),
            ),
            _buildLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          controller: _nameController,
          labelText: "Имя",
          onChanged: (_) => setState(() {}),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: CustomTextField(
            onChanged: (_) => setState(() {}),
            controller: _emailController,
            labelText: "Почта",
            isEmail: true,
            keyboardType: TextInputType.emailAddress,
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          child: CustomTextField(
            onChanged: (_) => setState(() {}),
            controller: _passwordController,
            labelText: "Пароль",
            isPassword: true,
            obscureText: !_isPasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                  // Синхронизируем валидацию после переключения видимости
                  _validateSecondStep();
                });
              },
            ),
          ),
        ),

        CustomBlueButton(
          text: "Войти",
          backgroundColor:
              _isStepValid ? kActiveButtonColor : kInactiveButtonColor,
          borderColor: _isStepValid ? kActiveButtonColor : Colors.transparent,
          shadow: _isStepValid ? kActiveButtonColor : Colors.transparent,
          onPressed:
              _isStepValid ? () => log("Login valid: $_isStepValid") : null,
        ),
        const SizedBox(height: 8),
        CustomBlueButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()),
            );
          },
          text: "Зарегестрироваться",
          backgroundColor: kBackgroundColor,
          borderColor: kBorderColor,
          shadow: kActiveButtonColor,
        ),
      ],
    );
  }

  // Метод для ручной валидации второго шага
  void _validateSecondStep() {
    setState(() {});
  }
}
