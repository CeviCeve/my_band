import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/servise/date_validator.dart';
import 'package:my_band/ui/element/custom/custom_blue_button.dart';
import 'package:my_band/ui/element/custom/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Контроллеры для текстовых полей
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Переключение между частями (1 или 2)
  int _currentStep = 1;

  // Для показа/скрытия пароля
  bool _isPasswordVisible = false;

  bool get _isFirstStepValid =>
      _nameController.text.isNotEmpty &&
      _surnameController.text.isNotEmpty &&
      _dayController.text.isNotEmpty &&
      _monthController.text.isNotEmpty &&
      _yearController.text.isNotEmpty;

  bool get _isSecondStepValid =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void dispose() {
    // Утилизация контроллеров
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
        backgroundColor: const Color.fromARGB(255, 18, 18, 23),
        elevation: 0,
        centerTitle: true,
        leading:
            _currentStep == 2
                ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _currentStep = 1;
                    });
                  },
                )
                : null, // Кнопка "Назад" появляется только на втором этапе
      ),
      backgroundColor: const Color.fromARGB(255, 18, 18, 23),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Регистрация",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            _currentStep == 1 ? _buildFirstStep() : _buildSecondStep(),
          ],
        ),
      ),
    );
  }

  // Первая часть
  Widget _buildFirstStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          controller: _nameController,
          labelText: "Имя",
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _surnameController,
          labelText: "Фамилия",
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _dayController,
                labelText: "ДД",
                onChanged: (_) => setState(() {}),
                isNumeric: true,
                formatter: DateValidator(1, 31),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextField(
                controller: _monthController,
                labelText: "ММ",
                onChanged: (_) => setState(() {}),
                isNumeric: true,
                formatter: DateValidator(1, 12),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextField(
                controller: _yearController,
                labelText: "ГГГГ",
                onChanged: (_) => setState(() {}),
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
              _isFirstStepValid
                  ? Color.fromARGB(255, 21, 21, 185)
                  : Color.fromARGB(100, 21, 21, 185),
          borderColor:
              _isFirstStepValid
                  ? Color.fromARGB(255, 21, 21, 185)
                  : Color.fromARGB(255, 18, 18, 23),
          shadow:
              _isFirstStepValid
                  ? Color.fromARGB(255, 21, 21, 185)
                  : Colors.transparent,
          onPressed:
              _isFirstStepValid
                  ? () {
                    setState(() {
                      _currentStep = 2;
                    });
                  }
                  : null,
        ),
        const SizedBox(height: 8),
        // Кнопка "Войти"
        CustomBlueButton(
          onPressed: () {},
          text: "Войти",
          backgroundColor: const Color.fromARGB(255, 18, 18, 23),
          borderColor: Color.fromARGB(112, 21, 21, 185),
          shadow: Color.fromARGB(255, 21, 21, 185),
        ),
      ],
    );
  }

  // Вторая часть
  Widget _buildSecondStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          controller: _emailController,
          labelText: "Почта",
          isEmail: false,
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          onChanged: (_) => setState(() {}),
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: "Пароль",
            hintStyle: GoogleFonts.montserrat(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[800],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        const SizedBox(height: 24),
        CustomBlueButton(
          text: "Далее",
          backgroundColor:
              _isSecondStepValid
                  ? Color.fromARGB(255, 21, 21, 185)
                  : Color.fromARGB(100, 25, 25, 229),
          borderColor:
              _isSecondStepValid
                  ? Color.fromARGB(255, 21, 21, 185)
                  : Color.fromARGB(0, 25, 25, 229),
          shadow:
              _isSecondStepValid
                  ? Color.fromARGB(255, 21, 21, 185)
                  : Colors.transparent,
          onPressed:
              _isSecondStepValid
                  ? () {
                    setState(() {
                      _currentStep = 2;
                    });
                  }
                  : null,
        ),
        const SizedBox(height: 8),
        CustomBlueButton(
          onPressed: () {},
          text: "Войти",
          backgroundColor: const Color.fromARGB(255, 18, 18, 23),
          borderColor: Color.fromARGB(112, 21, 21, 185),
          shadow: Color.fromARGB(255, 21, 21, 185),
        ),
      ],
    );
  }
}
