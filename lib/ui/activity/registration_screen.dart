import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/servise/date_validator.dart';
import 'package:my_band/ui/activity/login_screen.dart';
import 'package:my_band/ui/element/custom/custom_blue_button.dart';
import 'package:my_band/ui/element/custom/custom_textfield.dart';

const Color kActiveButtonColor = Color.fromARGB(255, 21, 21, 185);
const Color kInactiveButtonColor = Color.fromARGB(100, 25, 25, 229);
const Color kBackgroundColor = Color.fromARGB(255, 18, 18, 23);
const Color kBorderColor = Color.fromARGB(112, 21, 21, 185);

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _currentStep = 1;
  bool _isPasswordVisible = false;

  bool get _isFirstStepValid =>
      _nameController.text.isNotEmpty &&
      _surnameController.text.isNotEmpty &&
      _dayController.text.isNotEmpty &&
      _monthController.text.isNotEmpty &&
      _yearController.text.isNotEmpty;

  bool get _isSecondStepValid {
    final isValid =
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(_emailController.text) &&
        _passwordController.text.length >= 8;
    log(
      "Second step valid: $isValid, Email: ${_emailController.text}, Password: ${_passwordController.text}, Length: ${_passwordController.text.length}",
    );
    return isValid;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
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
        leading:
            _currentStep == 2
                ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => setState(() => _currentStep = 1),
                )
                : null,
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text(
                "Регистрация",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
            _currentStep == 1 ? _buildFirstStep() : _buildSecondStep(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstStep() {
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
            controller: _surnameController,
            labelText: "Фамилия",
            onChanged: (_) => setState(() {}),
          ),
        ),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                onChanged: (_) => setState(() {}),
                controller: _dayController,
                labelText: "ДД",
                isNumeric: true,
                formatter: DateValidator(1, 31),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextField(
                onChanged: (_) => setState(() {}),
                controller: _monthController,
                labelText: "ММ",
                isNumeric: true,
                formatter: DateValidator(1, 12),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextField(
                onChanged: (_) => setState(() {}),
                controller: _yearController,
                labelText: "ГГГГ",
                isNumeric: true,
                formatter: DateValidator(0, DateTime.now().year),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomBlueButton(
          text: "Далее",
          backgroundColor:
              _isFirstStepValid ? kActiveButtonColor : kInactiveButtonColor,
          borderColor:
              _isFirstStepValid ? kActiveButtonColor : kBackgroundColor,
          shadow: _isFirstStepValid ? kActiveButtonColor : Colors.transparent,
          onPressed:
              _isFirstStepValid ? () => setState(() => _currentStep = 2) : null,
        ),
        const SizedBox(height: 8),
        CustomBlueButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          text: "Войти",
          backgroundColor: kBackgroundColor,
          borderColor: kBorderColor,
          shadow: kActiveButtonColor,
        ),
      ],
    );
  }

  Widget _buildSecondStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          onChanged: (_) => setState(() {}),
          controller: _emailController,
          labelText: "Почта",
          isEmail: true,
          keyboardType: TextInputType.emailAddress,
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
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
          text: "Зарегестрироваться",
          backgroundColor:
              _isSecondStepValid ? kActiveButtonColor : kInactiveButtonColor,
          borderColor:
              _isSecondStepValid ? kActiveButtonColor : Colors.transparent,
          shadow: _isSecondStepValid ? kActiveButtonColor : Colors.transparent,
          onPressed:
              _isSecondStepValid
                  ? () => log("Second step valid: $_isSecondStepValid")
                  : null,
        ),
      ],
    );
  }

  // Метод для ручной валидации второго шага
  void _validateSecondStep() {
    setState(() {});
  }
}
