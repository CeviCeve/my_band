import 'package:flutter/services.dart';

class DateValidator extends TextInputFormatter {
  final int minValue;
  final int maxValue;

  DateValidator(this.minValue, this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Если новое значение пустое, разрешаем его
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Проверяем, что введены только цифры
    final RegExp digitsOnly = RegExp(r'^\d+$');
    if (!digitsOnly.hasMatch(newValue.text)) {
      return oldValue; // Если не цифры, возвращаем старое значение
    }

    // Преобразуем введенное значение в число
    final int? value = int.tryParse(newValue.text);
    if (value == null) {
      return oldValue; // Если не удалось преобразовать, возвращаем старое значение
    }

    // Проверяем диапазон (minValue до maxValue)
    if (value < minValue || value > maxValue) {
      return oldValue; // Если значение вне диапазона, возвращаем старое значение
    }

    return newValue; // Если всё в порядке, разрешаем новое значение
  }
}
