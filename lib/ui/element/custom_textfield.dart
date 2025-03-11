import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isNumeric;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? errorText;
  final String? errorLabelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputFormatter? formatter;

  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;

  final Color? fillColor;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isNumeric = false,
    this.onChanged,
    this.focusNode,
    this.errorText,
    this.errorLabelText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.fillColor,
    this.formatter,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hasError = false;
  bool _isFocused = false;
  late FocusNode _internalFocusNode; // Внутренний FocusNode

  @override
  void initState() {
    super.initState();
    // Используем переданный FocusNode или создаем новый
    _internalFocusNode = widget.focusNode ?? FocusNode();

    // Проверка ошибки при изменении текста
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {
          _hasError =
              widget.controller.text.isEmpty ||
              widget.controller.text.length > 20;
        });
      }
    });

    // Отслеживание фокуса
    _internalFocusNode.addListener(() {
      if (mounted) {
        setState(() {
          _isFocused = _internalFocusNode.hasFocus;
        });
      }
    });
  }

  @override
  void dispose() {
    // Удаляем слушатель перед утилизацией
    _internalFocusNode.removeListener(() {
      if (mounted) {
        setState(() {
          _isFocused = _internalFocusNode.hasFocus;
        });
      }
    });

    // Утилизируем FocusNode только если он был создан внутри
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  // цвет рамки в зависимости от состояния
  Color _getCurrentBorderColor() {
    if (_hasError) {
      if (_isFocused) {
        return widget.focusedErrorBorderColor ?? Colors.red;
      }
      return widget.errorBorderColor ?? Colors.red;
    }
    if (_isFocused) {
      return widget.focusedBorderColor ?? Colors.blue;
    }
    return widget.enabledBorderColor ?? const Color.fromARGB(0, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    // ФЫильтры
    final List<TextInputFormatter> formatters = [];

    formatters.add(FilteringTextInputFormatter.deny(RegExp(r'\s')));
    formatters.add(widget.formatter ?? (FilteringTextInputFormatter.deny("")));
    if (widget.isNumeric) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _getCurrentBorderColor().withAlpha(125),
            blurRadius: _isFocused || _hasError ? 8.0 : 4.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _internalFocusNode,
        onChanged: widget.onChanged ?? (_) => setState(() {}),
        keyboardType:
            widget.keyboardType ??
            (widget.isNumeric ? TextInputType.number : TextInputType.text),
        inputFormatters: formatters,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText:
              _hasError && widget.errorLabelText != null
                  ? widget.errorLabelText
                  : widget.labelText,
          labelStyle: TextStyle(
            color:
                (_hasError && _isFocused)
                    ? Colors.redAccent
                    : _isFocused
                    ? _getCurrentBorderColor()
                    : Color.fromARGB(255, 158, 158, 184),
          ),

          filled: true,
          fillColor: widget.fillColor ?? const Color.fromARGB(255, 18, 18, 23),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color:
                  widget.errorBorderColor ??
                  const Color.fromARGB(255, 158, 158, 184),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: widget.focusedBorderColor ?? Colors.blueAccent,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: widget.errorBorderColor ?? Colors.red,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color:
                  widget.focusedErrorBorderColor ??
                  const Color.fromARGB(255, 255, 0, 0),
              width: 2.0,
            ),
          ),
          errorText: widget.errorText ?? (_hasError ? "Ошибка" : null),
          suffixIcon: widget.suffixIcon,
        ),
        style: GoogleFonts.montserrat(color: Colors.white),
      ),
    );
  }
}
