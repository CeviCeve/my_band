import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGroupDialog extends StatefulWidget {
  final Function(String, String) onAddGroup;

  const AddGroupDialog({super.key, required this.onAddGroup});

  @override
  State<AddGroupDialog> createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupGenreController = TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupGenreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Создать группу',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _groupNameController,
            style: GoogleFonts.montserrat(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Название группы',
              labelStyle: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 158, 158, 184),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 18, 18, 23),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 158, 158, 184),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _groupGenreController,
            style: GoogleFonts.montserrat(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Жанр',
              labelStyle: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 158, 158, 184),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 18, 18, 23),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 158, 158, 184),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_groupNameController.text.isNotEmpty &&
                    _groupGenreController.text.isNotEmpty) {
                  widget.onAddGroup(
                    _groupNameController.text,
                    _groupGenreController.text,
                  );
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 21, 21, 184),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Создать',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
