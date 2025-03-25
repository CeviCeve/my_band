import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';
import 'package:my_band/data/servise/decoder.dart';
import 'package:my_band/ui/activity/my_contacts_screen.dart';
import 'package:my_band/ui/activity/my_group_screen.dart';
import 'package:my_band/ui/activity/my_instruments_screen.dart';
import 'package:my_band/ui/element/custom/custom_button_large.dart';
import 'package:my_band/ui/helper/anim_helper.dart';

// Экран профиля пользователя
class ProfileScreen extends StatefulWidget {
  final User? user; // Модель пользователя, может быть null

  const ProfileScreen({super.key, this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final EnumDecoder decoder = EnumDecoder();

  void t() {
    log("true");
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Заголовок с фоновым изображением и аватаром
            Stack(
              children: [
                // Фоновое изображение
                Container(
                  height: 111,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/forest.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Кнопка для изображения (справа вверху)
                Positioned(
                  top: 16,
                  right: 12,
                  child: Card(
                    color: const Color.fromARGB(255, 21, 21, 184),
                    child: SizedBox(
                      height: 29,
                      width: 29,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        splashColor: Colors.blue,
                        onTap: () {},
                        child: Icon(
                          Icons.image_outlined,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),
                    ),
                  ),
                ),
                // Аватар пользователя
                Positioned(
                  bottom: 0,
                  left: 16,
                  child: CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                ),
                // Кнопка редактирования
                Positioned(
                  bottom: 30,
                  right: 18,
                  child: InkWell(
                    onTap: () {},
                    splashColor: const Color.fromARGB(0, 0, 0, 0),
                    child: Icon(Icons.edit),
                  ),
                ),
                SizedBox(height: 171),
              ],
            ),
            // Основная информация пользователя
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Имя и местоположение
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 17, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.user?.name ?? "ЭЭмма"} ${widget.user?.surname ?? "Уотсон"}",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.user?.location?.getLocation ??
                            "Неопознаная локация",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                // Информационные строки
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    children: [
                      _buildInfoRow(
                        "Музыкальное образование:",
                        widget.user?.education ?? "отсутствует",
                      ),
                      _buildInfoRow("Статус:", widget.user?.status ?? "-"),
                      _buildInfoRow("Дата рождения:", "пока пусто"),
                      _buildInfoRow(
                        "Любимая группа:",
                        widget.user?.likeBand ?? "Metallica",
                      ),
                    ],
                  ),
                ),
                // О себе
                Container(
                  color: const Color.fromARGB(255, 28, 28, 38),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 0, 0),
                          child: Text(
                            "О себе",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                          child: Text(
                            widget.user?.about ?? "...",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Кнопки действий
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Column(
                    children: [
                      CustomButton(
                        text: "Мои инструменты",
                        textSize: 12,
                        heigth: 20,
                        function:
                            () => AnimHelper.slideLefttoRight(
                              MyInstrumentsScreen(),
                              context,
                            ),
                      ),
                      CustomButton(
                        text: "Мои группы",
                        textSize: 12,
                        heigth: 20,
                        function:
                            () => AnimHelper.slideLefttoRight(
                              MyGroupsScreen(
                                user: User(
                                  name: "имя",
                                  password: "yghuji",
                                  userCode: "",
                                  email: 'emma.watson@example.com',
                                  groups: [
                                    Group(
                                      name: 'SuperMegaDemons',
                                      style: 'power-metal',
                                      creatorId: 'emma.watson@example.com',
                                      about: 'Cool band!',
                                      users: ['emma.watson@example.com'],
                                      icon: 'assets/my_band.png',
                                    ),
                                    Group(
                                      name: 'SuperMegaDemons',
                                      style: 'power-metal',
                                      creatorId: 'other.user@example.com',
                                      about: 'Another cool band!',
                                      users: [
                                        'other.user@example.com',
                                        'emma.watson@example.com',
                                      ],
                                      icon: 'assets/my_band.png',
                                    ),
                                  ],
                                ),
                              ),
                              context,
                            ),
                      ),
                      CustomButton(
                        text: "Мои контакты",
                        textSize: 12,
                        heigth: 20,
                        function:
                            () => AnimHelper.slideLefttoRight(
                              MyContactsScreen(),
                              context,
                            ),
                      ),
                    ],
                  ),
                ),
                // Карточка уровня владения инструментами
                _buildProficiencyCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Виджет карточки уровня владения инструментами
  Widget _buildProficiencyCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 40, 50),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Уровень владения инструментом",
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // Список инструментов и уровней
          ListView.builder(
            shrinkWrap: true, // Уменьшает размер до содержимого
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.user?.proficiencyLevel.length ?? 2,
            itemBuilder: (context, index) {
              final instrument =
                  widget.user?.proficiencyLevel[index].instrument;
              final level = widget.user?.proficiencyLevel[index].level;

              return _buildInfoRow(
                decoder.instrumentDecoder(instrument) ?? "Ошибка",
                decoder.proficiencyDecoder(level) ?? "Ошибка",
                onTitleTap: () => showInstrumentPicker(index),
                onValueTap: () => showProficiencyPicker(index),
              );
            },
          ),
          // Кнопка добавления нового инструмента
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Виджет строки информации
  Widget _buildInfoRow(
    String title,
    String value, {
    VoidCallback? onTitleTap,
    VoidCallback? onValueTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTitleTap,
            child: Text(
              title,
              style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: onValueTap,
            child: Text(
              value,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: const Color.fromARGB(255, 158, 158, 184),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Модальное окно выбора инструмента
  void showInstrumentPicker(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(8),
          child: ListView(
            children:
                decoder.instrumentMap.entries.map((entry) {
                  return ListTile(
                    title: Text(
                      entry.value, // Название инструмента
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                    onTap: () {
                      setState(() {
                        widget.user?.proficiencyLevel[index].instrument =
                            entry.key; // Установка значения
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
  void showProficiencyPicker(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(8),
          child: ListView(
            children:
                decoder.proficiencyMap.entries.map((entry) {
                  return ListTile(
                    title: Text(
                      entry.value, // Название уровня
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                    onTap: () {
                      setState(() {
                        widget.user?.proficiencyLevel[index].level =
                            entry.key; // Установка значения
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
