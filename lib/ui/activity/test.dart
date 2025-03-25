import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/local/contact_model.dart';
import 'package:my_band/ui/element/custom/custom_blue_button.dart';

class ContactsScreen extends StatefulWidget {
  final List<Contact>? contacts;
  const ContactsScreen({super.key, this.contacts});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  // Список контактов
  late List<Contact> contacts =
      widget.contacts ??
      [
        Contact(
          name: 'Telegram',
          inside: 'Обязательно к заполнению',
          visibility: true,
        ),
        Contact(
          name: 'Instagram',
          inside: 'Обязательно к заполнению',
          visibility: true,
        ),
        Contact(
          name: 'VK',
          inside: 'Обязательно к заполнению',
          visibility: true,
        ),
        Contact(
          name: 'Телефон',
          inside: 'Обязательно к заполнению',
          visibility: true,
        ),
      ];

  // Контроллеры для нового/редактируемого контакта
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  // Функция для изменения видимости контакта
  void _toggleVisibility(int index) {
    setState(() {
      contacts[index] = contacts[index].copyWith(
        visibility: !(contacts[index].visibility ?? true),
      );
    });
  }

  // Функция для добавления нового контакта
  void _addContact(String name, String value) {
    setState(() {
      contacts.add(Contact(name: name, inside: value, visibility: true));
    });
  }

  // Функция для редактирования существующего контакта
  void _editContact(int index, String name, String value) {
    setState(() {
      contacts[index] = contacts[index].copyWith(name: name, inside: value);
    });
  }

  // Отображение модального окна для создания нового контакта
  void _showAddContactDialog() {
    _nameController.clear();
    _valueController.clear();
    _showContactDialog(
      title: 'Добавить контакт',
      onSubmit: (name, value) => _addContact(name, value),
    );
  }

  // Отображение модального окна для редактирования контакта
  void _showEditContactDialog(int index) {
    // Предзаполняем поля текущими значениями
    _nameController.text = contacts[index].name ?? '';
    _valueController.text = contacts[index].inside ?? '';

    _showContactDialog(
      title: 'Редактировать контакт',
      onSubmit: (name, value) => _editContact(index, name, value),
    );
  }

  // Общий метод для отображения модального окна (для создания и редактирования)
  void _showContactDialog({
    required String title,
    required void Function(String name, String value) onSubmit,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 28, 28, 38), // Тёмный фон
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              // Поле для названия контакта
              TextField(
                controller: _nameController,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Название (например, WhatsApp)',
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
              // Поле для значения контакта
              TextField(
                controller: _valueController,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Значение (например, @username)',
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
              // Кнопка "Создать" или "Сохранить"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty &&
                        _valueController.text.isNotEmpty) {
                      onSubmit(_nameController.text, _valueController.text);
                      _nameController.clear();
                      _valueController.clear();
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
                    title == 'Добавить контакт' ? 'Создать' : 'Сохранить',
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 23), // Тёмный фон
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
            title: Text(
              "Мои Контакты",
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: contacts.length + 1, // +1 для кнопки "Создать"
        itemBuilder: (context, index) {
          if (index == contacts.length) {
            // Кнопка "Создать"
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CustomBlueButton(
                text: "Создать",
                backgroundColor: const Color.fromARGB(255, 21, 21, 185),
                shadow: const Color.fromARGB(255, 21, 21, 185),
                borderColor: Colors.transparent,
                onPressed: () => _showAddContactDialog(),
              ),
            );
          }

          final contact = contacts[index];

          return GestureDetector(
            onLongPress:
                () => _showEditContactDialog(
                  index,
                ), // Долгое нажатие для редактирования
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Название и значение контакта
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.name ?? 'Без названия',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        contact.inside ?? 'Нет значения',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 158, 158, 184),
                        ),
                      ),
                    ],
                  ),
                  // Иконка "глазика" для изменения видимости
                  IconButton(
                    onPressed: () => _toggleVisibility(index),
                    icon: Icon(
                      (contact.visibility ?? true)
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color.fromARGB(255, 158, 158, 184),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
