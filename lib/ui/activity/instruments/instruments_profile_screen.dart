import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/global_data.dart';
import 'package:my_band/data/dto_pattern/models/local/instrument_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';
import 'package:my_band/data/enum/instruments.dart';
import 'package:my_band/data/enum/proficiency.dart';
import 'package:my_band/data/servise/decoder.dart';
import 'package:my_band/ui/activity/instruments/instrument_gallery.dart';
import 'package:my_band/ui/activity/instruments/instrument_info_section.dart';

class InstrumentProfileScreen extends StatefulWidget {
  final User user;
  final Instrument? instrument;

  const InstrumentProfileScreen({
    super.key,
    required this.user,
    this.instrument,
  });

  @override
  State<InstrumentProfileScreen> createState() =>
      _InstrumentProfileScreenState();
}

class _InstrumentProfileScreenState extends State<InstrumentProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _manufacturerController = TextEditingController();
  final TextEditingController _possessionTimeController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final EnumDecoder decoder = EnumDecoder();

  Instruments? _selectedType;
  Proficiency? _selectedProficiency;

  final List<String> _imagePaths = ['assets/my_band.png', 'assets/forest.png'];

  @override
  void initState() {
    super.initState();
    // Инициализация полей, если передан существующий инструмент
    if (widget.instrument != null) {
      _nameController.text = widget.instrument!.name;
      _manufacturerController.text = widget.instrument!.manufacturer ?? '';
      _possessionTimeController.text = widget.instrument!.possessionTime ?? '';
      _descriptionController.text = widget.instrument!.about ?? '';
      _selectedType = widget.instrument?.type;
      _selectedProficiency = widget.instrument!.proficiencyLevel;
      if (widget.instrument!.instrumentPhoto != null) {
        _imagePaths.clear();
        _imagePaths.addAll(widget.instrument!.instrumentPhoto!);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _manufacturerController.dispose();
    _possessionTimeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Функция для создания/обновления инструмента
  void _saveInstrument() {
    final newInstrument = Instrument(
      name: _nameController.text,
      manufacturer:
          _manufacturerController.text.isNotEmpty
              ? _manufacturerController.text
              : null,
      type: widget.instrument?.type ?? Instruments.grandPiano,
      possessionTime:
          _possessionTimeController.text.isNotEmpty
              ? _possessionTimeController.text
              : null,
      proficiencyLevel: _selectedProficiency ?? Proficiency.Beginner,
      about:
          _descriptionController.text.isNotEmpty
              ? _descriptionController.text
              : null,
      instrumentPhoto: _imagePaths.isNotEmpty ? _imagePaths : null,
    );

    setState(() {
      // Если передан инструмент, обновляем его
      if (widget.instrument?.name.length != null) {
        final index = widget.user.instruments.indexOf(widget.instrument!);
        if (index != -1) {
          widget.user.instruments[index] = newInstrument;
        }
      } else {
        // Иначе добавляем новый инструмент в список TODO:
        newInstrument.about = _descriptionController.text;
        newInstrument.type = _selectedType!;
        newInstrument.possessionTime = _possessionTimeController.text;
        newInstrument.proficiencyLevel = _selectedProficiency!;
        //widget.user.instruments.add(newInstrument);
        GlobalData.user.instruments.add(newInstrument);

        log(newInstrument.type.toString());
        log(GlobalData.user.instruments.toString());
      }
    });

    // Закрываем экран
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 38),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 41, 41, 56),
                width: 1,
              ),
            ),
          ),
          child: AppBar(
            surfaceTintColor: Colors.transparent,
            title: Text(
              widget.instrument?.name ?? "Пусто...",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 20)],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 28, 28, 38),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstrumentGallery(
              imagePaths: _imagePaths,
              onAddImage: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Добавить изображение')),
                );
              },
            ),
            const SizedBox(height: 16),
            InstrumentInfoSection(
              descriptionController: _descriptionController,
              nameController: _nameController,
              manufacturerController: _manufacturerController,
              possessionTimeController: _possessionTimeController,
              selectedType: _selectedType,
              selectedProficiency: _selectedProficiency,
              decoder: decoder,
              onSelectType: (type) {
                setState(() {
                  _selectedType = type;
                });
              },
              onSelectProficiency: (proficiency) {
                setState(() {
                  _selectedProficiency = proficiency;
                });
              },
              onSave: _saveInstrument,
            ),
          ],
        ),
      ),
    );
  }
}
