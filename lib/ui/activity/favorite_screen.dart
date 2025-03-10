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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder:
                  (context, index) => ClipRRect(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/forest.png',
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                color: Colors.black.withAlpha(50),
                              ),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  backgroundImage: AssetImage(
                                    "assets/forest.png",
                                  ),
                                  radius: 34,
                                ),

                                Expanded(
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    color: Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// Имя + возраст
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Имя Фамилия $index",
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "25 лет",
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.grey[400],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Text(
                                            "Локация",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.grey[400],
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              12,
                                              0,
                                              0,
                                            ),
                                            child: Text(
                                              "В поиске",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.grey[400],
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),

                                          /// Инструменты
                                          Text(
                                            "Инструмент(ы)",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
