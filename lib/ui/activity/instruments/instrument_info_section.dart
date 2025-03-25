import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/enum/instruments.dart';
import 'package:my_band/data/enum/proficiency.dart';
import 'package:my_band/data/servise/decoder.dart';
import 'package:my_band/ui/activity/instruments/picker_modal.dart';
import 'package:my_band/ui/element/custom/custom_blue_button.dart';

class InstrumentInfoSection extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController nameController;
  final TextEditingController manufacturerController;
  final TextEditingController possessionTimeController;
  final Instruments? selectedType;
  final Proficiency? selectedProficiency;
  final EnumDecoder decoder;
  final Function(Instruments) onSelectType;
  final Function(Proficiency) onSelectProficiency;
  final VoidCallback onSave;

  const InstrumentInfoSection({
    super.key,
    required this.descriptionController,
    required this.nameController,
    required this.manufacturerController,
    required this.possessionTimeController,
    required this.selectedType,
    required this.selectedProficiency,
    required this.decoder,
    required this.onSelectType,
    required this.onSelectProficiency,
    required this.onSave,
  });

  // Стиль для TextField
  InputDecoration _textFieldDecoration(String hintText) {
    return InputDecoration(
      hintText: "Пусто...",
      hintStyle: GoogleFonts.montserrat(
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
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Дополнительная информация',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withAlpha(125),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextField(
              controller: descriptionController,
              maxLines: 4,
              style: GoogleFonts.montserrat(color: Colors.white),
              decoration: _textFieldDecoration(
                'Введите описание инструмента...',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Название',
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withAlpha(125),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextField(
              controller: nameController,
              style: GoogleFonts.montserrat(color: Colors.white),
              decoration: _textFieldDecoration('Введите название'),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Производитель',
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withAlpha(125),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextField(
              controller: manufacturerController,
              style: GoogleFonts.montserrat(color: Colors.white),
              decoration: _textFieldDecoration('Введите производителя'),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Тип',
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              PickerModal.show<Instruments>(
                context: context,
                items: decoder.instrumentMap,
                onSelected: onSelectType,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedType != null
                        ? decoder.instrumentDecoder(selectedType) ??
                            'Выберите тип'
                        : 'Выберите тип',
                    style: GoogleFonts.montserrat(
                      color: selectedType != null ? Colors.white : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Время владения',
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withAlpha(125),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextField(
              controller: possessionTimeController,
              style: GoogleFonts.montserrat(color: Colors.white),
              decoration: _textFieldDecoration('Введите время владения'),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Уровень владения',
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              PickerModal.show<Proficiency>(
                context: context,
                items: decoder.proficiencyMap,
                onSelected: onSelectProficiency,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedProficiency != null
                        ? decoder.proficiencyDecoder(selectedProficiency) ??
                            'Выберите уровень'
                        : 'Выберите уровень',
                    style: GoogleFonts.montserrat(
                      color:
                          selectedProficiency != null
                              ? Colors.white
                              : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomBlueButton(text: "Сохранить", onPressed: onSave),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
