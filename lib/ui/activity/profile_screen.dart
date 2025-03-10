import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/models/user_model.dart';
import 'package:my_band/ui/element/custom_button_large.dart';

class ProfileScreen extends StatelessWidget {
  final User? user;
  const ProfileScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 111,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/forest.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 12,
                  child: Card(
                    color: const Color.fromARGB(255, 21, 21, 184),
                    child: SizedBox(
                      height: 29,
                      width: 29,
                      child: Icon(
                        Icons.image_outlined,
                        color: Colors.white,
                        size: 19,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 16,
                  child: CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/emma.png'),
                  ),
                ),
                Positioned(bottom: 30, right: 18, child: Icon(Icons.edit)),
                SizedBox(height: 171),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 17, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user?.name ?? "ЭЭмма"} ${user?.surname ?? "Уотсон"}",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        user?.location?.getLocation ?? "Неопознаная локация",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    children: [
                      _buildInfoRow(
                        "Музыкальное образование:",
                        user?.education ?? "отсутствует",
                      ),
                      _buildInfoRow("Статус:", user?.status ?? "-"),
                      _buildInfoRow(
                        "Дата рождения:",
                        "${user?.dob?.day != null ? "${user?.dob?.day}." : "не"}"
                            "${user?.dob?.month != null ? "${user?.dob?.month}." : " заполненное"}"
                            "${user?.dob?.day ?? " поле"}",
                      ),
                      _buildInfoRow(
                        "Любимая группа:",
                        user?.likeBand ?? "Metallica",
                      ),
                    ],
                  ),
                ),

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
                            user?.about ?? "Не описано\n...",
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

                CustomButton(text: "Мои инструменты", textSize: 12, heigth: 20),
                CustomButton(text: "Мои группы", textSize: 12, heigth: 20),
                CustomButton(text: "Мои контакты", textSize: 12, heigth: 20),

                _buildProficiencyCard(),
              ],
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
            style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
          ),
          Text(
            value,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: const Color.fromARGB(255, 158, 158, 184),
            ),
          ),
        ],
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

          _buildInfoRow("Электрогитара:", "средний"),
          _buildInfoRow("Бас-гитара:", "высокий"),

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
