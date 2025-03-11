import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Для inputFormatters
import 'package:google_fonts/google_fonts.dart';

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

  // Проверка заполненности полей для первой части (Имя, Фамилия, День, Месяц, Год)
  bool get _isFirstStepValid =>
      _nameController.text.isNotEmpty &&
      _surnameController.text.isNotEmpty &&
      _dayController.text.isNotEmpty &&
      _monthController.text.isNotEmpty &&
      _yearController.text.isNotEmpty;

  // Проверка заполненности полей для второй части
  bool get _isSecondStepValid =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

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
        centerTitle: true,
        backgroundColor: Colors.black, // TODO: AppBar color (black)
        elevation: 0, // Убираем тень
        title: Text(
          "Регистрация",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      backgroundColor: Colors.black, // TODO: Background color (black)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Убрали заголовок из тела, он теперь в AppBar
              const SizedBox(height: 32),
              // Форма в зависимости от текущего шага
              _currentStep == 1 ? _buildFirstStep() : _buildSecondStep(),
              const Spacer(),
              // Кнопка "Войти"
              TextButton(
                onPressed: () {}, // TODO: Реализовать переход на экран входа
                child: Text(
                  "Войти",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Первая часть
  Widget _buildFirstStep() {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: "Имя",
            hintStyle: GoogleFonts.montserrat(
              color: Colors.grey, // TODO: Hint text color (grey)
            ),
            filled: true,
            fillColor: Colors.grey[800], // TODO: Background color (dark grey)
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        const SizedBox(height: 16),

        TextField(
          controller: _surnameController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: "Фамилия",
            hintStyle: GoogleFonts.montserrat(
              color: Colors.grey, // TODO: Hint text color (grey)
            ),
            filled: true,
            fillColor: Colors.grey[800], // TODO: Background color (dark grey)
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _dayController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "ДД",
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.grey, // TODO: Hint text color (grey)
                  ),
                  filled: true,
                  fillColor:
                      Colors.grey[800], // TODO: Background color (dark grey)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.montserrat(color: Colors.white),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _monthController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "ММ",
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.grey, // TODO: Hint text color (grey)
                  ),
                  filled: true,
                  fillColor:
                      Colors.grey[800], // TODO: Background color (dark grey)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.montserrat(color: Colors.white),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _yearController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "ГГГГ",
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.grey, // TODO: Hint text color (grey)
                  ),
                  filled: true,
                  fillColor:
                      Colors.grey[800], // TODO: Background color (dark grey)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.montserrat(color: Colors.white),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Кнопка "Далее"
        ElevatedButton(
          onPressed:
              _isFirstStepValid
                  ? () {
                    setState(() {
                      _currentStep = 2; // Переход ко второй части
                    });
                  }
                  : null, // Кнопка неактивна, если поля не заполнены
          style: ElevatedButton.styleFrom(
            backgroundColor:
                _isFirstStepValid
                    ? Colors
                        .blue // TODO: Active button color (blue)
                    : Colors.grey, // TODO: Inactive button color (grey)
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            "Далее",
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  // Вторая часть
  Widget _buildSecondStep() {
    return Column(
      children: [
        // Убрали заголовок, он теперь в AppBar
        const SizedBox(height: 32),

        TextField(
          controller: _emailController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: "Почта",
            hintStyle: GoogleFonts.montserrat(
              color: Colors.grey, // TODO: Hint text color (grey)
            ),
            filled: true,
            fillColor: Colors.grey[800], // TODO: Background color (dark grey)
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: GoogleFonts.montserrat(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        TextField(
          controller: _passwordController,
          onChanged: (_) => setState(() {}),
          obscureText: !_isPasswordVisible, // Показ/скрытие пароля
          decoration: InputDecoration(
            hintText: "Пароль",
            hintStyle: GoogleFonts.montserrat(
              color: Colors.grey, // TODO: Hint text color (grey)
            ),
            filled: true,
            fillColor: Colors.grey[800], // TODO: Background color (dark grey)
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey, // TODO: Icon color (grey)
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
        // Кнопка "Зарегистрироваться"
        ElevatedButton(
          onPressed: _isSecondStepValid ? () {} : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                _isSecondStepValid
                    ? Colors
                        .blue // TODO: Active button color (blue)
                    : Colors.grey, // TODO: Inactive button color (grey)
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            "Зарегистрироваться",
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
