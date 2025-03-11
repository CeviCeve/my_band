import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBlueButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadow;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CustomBlueButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 2,
          color: borderColor ?? const Color.fromARGB(255, 45, 33, 153),
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        boxShadow: [
          BoxShadow(
            color: shadow?.withAlpha(75) ?? const Color.fromARGB(0, 0, 0, 0),
            blurRadius: 10,
            spreadRadius: 2,
            //offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          onTap: () => onPressed?.call(),
          splashColor: borderColor?.withAlpha(75),
          hoverColor: borderColor?.withAlpha(75),
          child: Center(
            child: Text(
              text,
              style:
                  textStyle ??
                  GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
