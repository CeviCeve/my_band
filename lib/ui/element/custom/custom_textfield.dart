import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isNumeric;
  final bool isPassword;
  final bool isEmail;
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
    this.isEmail = false,
    this.isPassword = false,
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
  late FocusNode _internalFocusNode;

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
    _internalFocusNode.addListener(() {
      if (mounted) {
        setState(() {
          _isFocused = _internalFocusNode.hasFocus;
        });
      }
    });
    _validateInput(widget.controller.text);
  }

  @override
  void dispose() {
    _internalFocusNode.removeListener(() {});
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  void _validateInput(String value) {
    if (widget.isEmail) {
      _hasError = value.isEmpty || !emailRegExp.hasMatch(value);
    } else if (widget.isPassword) {
      _hasError = value.isEmpty || value.length < 8;
    } else {
      _hasError = value.isEmpty || value.length > 20;
    }
  }

  Color _getCurrentBorderColor() {
    if (_hasError) {
      return _isFocused
          ? (widget.focusedErrorBorderColor ?? Colors.red)
          : (widget.errorBorderColor ?? Colors.red);
    }
    return _isFocused
        ? (widget.focusedBorderColor ?? Colors.blue)
        : (widget.enabledBorderColor ?? const Color.fromARGB(0, 0, 0, 0));
  }

  TextInputType _getKeyboardType() {
    return widget.keyboardType ??
        (widget.isNumeric
            ? TextInputType.number
            : widget.isEmail
            ? TextInputType.emailAddress
            : TextInputType.text);
  }

  @override
  Widget build(BuildContext context) {
    final List<TextInputFormatter> formatters = [
      FilteringTextInputFormatter.deny(RegExp(r'\s')),
      if (widget.isNumeric) FilteringTextInputFormatter.digitsOnly,
      if (widget.formatter != null) widget.formatter!,
    ];

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
        onChanged: (value) {
          setState(() {
            _validateInput(value);
          });
          widget.onChanged?.call(value);
        },
        keyboardType: _getKeyboardType(),
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
                    : const Color.fromARGB(255, 158, 158, 184),
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
          errorText:
              widget.errorText ??
              (_hasError
                  ? (widget.isEmail
                      ? "Некорректный email"
                      : widget.isPassword
                      ? "Пароль должен быть не менее 8 символов"
                      : "Ошибка")
                  : null),
          suffixIcon: widget.suffixIcon,
        ),
        style: GoogleFonts.montserrat(color: Colors.white),
      ),
    );
  }
}
