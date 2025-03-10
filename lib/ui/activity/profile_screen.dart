import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/ui/element/custom_button_large.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Фоновое изображение
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/forest.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(Icons.image, color: Colors.white),
                ),
                Positioned(
                  bottom: -30,
                  left: 16,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Эмма Уотсон",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Минск, Ленинский р-н",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow("Музыкальное образование:", "самоучка"),
                  _buildInfoRow("Статус:", "в активном поиске"),
                  _buildInfoRow("Дата рождения:", "18.11.2000"),
                  _buildInfoRow("Любимая группа:", "Metallica"),
                  const SizedBox(height: 12),
                  Container(
                    color: const Color.fromARGB(255, 28, 28, 38),
                    child: Column(
                      children: [
                        Text(
                          "О себе",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Привет! Я музыкант с 5-летним опытом. Люблю экспериментировать со звуком.",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  CustomButton(
                    text: "Мои инструменты",
                    textSize: 12,
                    heigth: 20,
                  ),
                  CustomButton(text: "Мои группы", textSize: 12, heigth: 20),
                  CustomButton(text: "Мои контакты", textSize: 12, heigth: 20),
                  const SizedBox(height: 12),
                  _buildProficiencyCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 28, 28, 38),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          text,
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }

  Widget _buildProficiencyCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 28, 28, 38),
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
          const SizedBox(height: 8),
          _buildInfoRow("Электрогитара:", "средний"),
          _buildInfoRow("Бас-гитара:", "высокий"),
          const SizedBox(height: 8),
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
}
