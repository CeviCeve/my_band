import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/global_data.dart';
import 'package:my_band/data/dto_pattern/models/local/proficiency_level_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';
import 'package:my_band/data/servise/decoder.dart';
import 'package:my_band/ui/activity/instruments/my_instruments_screen.dart';
import 'package:my_band/ui/activity/my_contacts_screen.dart';
import 'package:my_band/ui/activity/my_group_screen.dart';
import 'package:my_band/ui/element/custom/custom_button_large.dart';
import 'package:my_band/ui/helper/anim_helper.dart';

// Экран профиля пользователя
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final EnumDecoder decoder = EnumDecoder();

  @override
  Widget build(BuildContextContext) {
    // Проверяем наличие текущего пользователя
    final user = GlobalData.user;

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
                      image: AssetImage(user.background ?? 'assets/forest.png'),
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
                    backgroundImage: AssetImage(
                      user.icon ?? 'assets/avatar.png',
                    ),
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
                        "${user.name} ${user.surname ?? ""}",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        user.location?.getLocation ?? "Неопознаная локация",
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
                        user.education ?? "отсутствует",
                      ),
                      _buildInfoRow("Статус:", user.status ?? "-"),
                      _buildInfoRow("Дата рождения:", user.dob ?? "пока пусто"),
                      _buildInfoRow(
                        "Любимая группа:",
                        user.likeBand ?? "Metallica",
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
                            user.about ?? "...",
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
                              MyGroupsScreen(user: user),
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
                _buildProficiencyCard(user),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Виджет карточки уровня владения инструментами
  Widget _buildProficiencyCard(User user) {
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
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: user.proficiencyLevel.length,
            itemBuilder: (context, index) {
              final proficiency = user.proficiencyLevel[index];
              return _buildInfoRow(
                decoder.instrumentDecoder(proficiency.instrument) ?? "Ошибка",
                decoder.proficiencyDecoder(proficiency.level) ?? "Ошибка",
                onTitleTap: () => showInstrumentPicker(index, user),
                onValueTap: () => showProficiencyPicker(index, user),
              );
            },
          ),
          // Кнопка добавления нового инструмента
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                setState(() {
                  user.proficiencyLevel.add(ProficiencyLevel());
                });
              },
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
  void showInstrumentPicker(int index, User user) {
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
                      entry.value,
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                    onTap: () {
                      setState(() {
                        user.proficiencyLevel[index].instrument = entry.key;
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
  void showProficiencyPicker(int index, User user) {
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
                      entry.value,
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                    onTap: () {
                      setState(() {
                        user.proficiencyLevel[index].level = entry.key;
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
