import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickerModal {
  static void show<T>({
    required BuildContext context,
    required Map<T, String> items,
    required Function(T) onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 28, 28, 38),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children:
                items.entries.map((entry) {
                  return ListTile(
                    title: Text(
                      entry.value,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      onSelected(entry.key);
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}
