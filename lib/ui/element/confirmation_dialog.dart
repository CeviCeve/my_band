import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationDialog {
  static Future<bool?> show({
    required BuildContext context,
    required String action,
    required String groupName,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 28, 28, 38),
          title: Text(
            'Вы желаете $action из группы "$groupName"?',
            style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Отмена',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 158, 158, 184),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Да',
                style: GoogleFonts.montserrat(fontSize: 14, color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
