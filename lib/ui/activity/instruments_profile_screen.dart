import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/local/instrument_model.dart';
import 'package:my_band/data/enum/instruments.dart';
import 'package:my_band/data/enum/proficiency.dart';
import 'package:my_band/data/servise/decoder.dart';
import 'package:my_band/ui/element/custom/custom_blue_button.dart';

class InstrumentProfileScreen extends StatefulWidget {
  final Instrument? instrument;
  const InstrumentProfileScreen({super.key, this.instrument});

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

  Instruments? _selectedType; // Для типа инструмента
  Proficiency? _selectedProficiency; // Для уровня владения

  final List<String> _imagePaths = [
    'assets/my_band.png', // Замените на свои изображения
    'assets/forest.png',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _manufacturerController.dispose();
    _possessionTimeController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
            backgroundColor: Color.fromARGB(255, 28, 28, 38),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Галерея изображений
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: _imagePaths.length + 1, // +1 для кнопки "Добавить"
                itemBuilder: (context, index) {
                  if (index == _imagePaths.length) {
                    return GestureDetector(
                      onTap: () {
                        // Логика добавления нового изображения
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Добавить изображение')),
                        );
                      },
                      child: Container(
                        color: const Color.fromARGB(255, 40, 40, 50),
                        child: const Center(
                          child: Icon(Icons.add, color: Colors.white, size: 50),
                        ),
                      ),
                    );
                  }
                  return Image.asset(
                    _imagePaths[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color.fromARGB(255, 18, 18, 23),
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.white),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Дополнительная информация
            Padding(
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
                  _buildCustomTextField(
                    controller: _descriptionController,
                    labelText: 'Введите описание инструмента...',
                    maxLines: 4,
                  ),
                  const SizedBox(height: 16),
                  // Поле "Название"
                  Text(
                    'Название',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildCustomTextField(
                    controller: _nameController,
                    labelText: 'Введите название',
                  ),
                  const SizedBox(height: 16),
                  // Поле "Производитель"
                  Text(
                    'Производитель',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildCustomTextField(
                    controller: _manufacturerController,
                    labelText: 'Введите производителя',
                  ),
                  const SizedBox(height: 16),
                  // Поле "Тип" (выпадающий список через модальное окно)
                  Text(
                    'Тип',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: showInstrumentPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedType != null
                                ? decoder.instrumentDecoder(_selectedType) ??
                                    'Выберите тип'
                                : 'Выберите тип',
                            style: GoogleFonts.montserrat(
                              color:
                                  _selectedType != null
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
                  const SizedBox(height: 16),
                  // Поле "Время владения"
                  Text(
                    'Время владения',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildCustomTextField(
                    controller: _possessionTimeController,
                    labelText: 'Введите время владения',
                  ),
                  const SizedBox(height: 16),
                  // Поле "Уровень владения" (выпадающий список через модальное окно)
                  Text(
                    'Уровень владения',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: showProficiencyPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedProficiency != null
                                ? decoder.proficiencyDecoder(
                                      _selectedProficiency,
                                    ) ??
                                    'Выберите уровень'
                                : 'Выберите уровень',
                            style: GoogleFonts.montserrat(
                              color:
                                  _selectedProficiency != null
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
                  CustomBlueButton(text: "Сохранить", onPressed: () {}),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Кастомное текстовое поле без проверок на ошибки
  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String labelText,
    int maxLines = 1,
  }) {
    return Container(
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
        controller: controller,
        maxLines: maxLines,

        style: GoogleFonts.montserrat(color: Colors.white),
        decoration: InputDecoration(
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
        ),
      ),
    );
  }

  // Модальное окно выбора инструмента
  void showInstrumentPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 28, 28, 38),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children:
                decoder.instrumentMap.entries.map((entry) {
                  return ListTile(
                    title: Text(
                      entry.value, // Название инструмента
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selectedType = entry.key; // Установка значения
                      });
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
          ),
        );
      },
    );
  }

  // Модальное окно выбора уровня владения
  void showProficiencyPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 28, 28, 38),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children:
                decoder.proficiencyMap.entries.map((entry) {
                  return ListTile(
                    title: Text(
                      entry.value, // Название уровня
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selectedProficiency = entry.key; // Установка значения
                      });
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
