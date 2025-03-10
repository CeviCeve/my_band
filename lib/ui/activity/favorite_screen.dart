import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/ui/element/search_element.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchElement(controller: TextEditingController()),

          /// Список карточек с размытым фоном внутри
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ClipRRect(
                      child: Stack(
                        children: [
                          /// Фоновая картинка внутри карточки
                          Positioned.fill(
                            child: Image.asset(
                              'assets/forest.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),

                          /// Размытие только внутри карточки
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                color: Colors.black26.withAlpha(20),
                              ),
                            ),
                          ),

                          // Контент карточки
                          SizedBox(
                            height: 111,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  backgroundImage: AssetImage(
                                    "assets/forest.png",
                                  ),
                                  radius: 34,
                                ),
                                Card(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Имя Фамилия $index",
                                            style: GoogleFonts.montserrat(
                                              color: Color.fromARGB(
                                                255,
                                                230,
                                                255,
                                                6,
                                              ),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text("25 Лет"),
                                        ],
                                      ),
                                      Text("Локация"),
                                      Text("В поиске"),
                                      Text("инструмент(ы)"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
