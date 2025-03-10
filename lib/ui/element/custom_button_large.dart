import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? heigth;
  final double? textSize;

  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.heigth,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 41, 41, 56)),
          borderRadius: BorderRadius.circular(15),
        ),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 28, 28, 38),
            foregroundColor: color ?? Colors.white,
            padding: EdgeInsets.symmetric(vertical: heigth ?? 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: color ?? Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
