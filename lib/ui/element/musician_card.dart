import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicianCard extends StatelessWidget {
  const MusicianCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/forest.png', fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withAlpha(50)),
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
                    backgroundImage: AssetImage("assets/forest.png"),
                    radius: 34,
                  ),

                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: const Color.fromARGB(255, 28, 28, 38),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      "Имя Фамилия",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Text(
                                      "Локация",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.grey[400],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(
                                    //     0,
                                    //     12,
                                    //     0,
                                    //     0,
                                    //   ),
                                    //   child: Text(
                                    //     "В поиске:",
                                    //     style: GoogleFonts.montserrat(
                                    //       color: Colors.grey[400],
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.w400,
                                    //     ),
                                    //   ),
                                    // ),

                                    /// Инструменты
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        26,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        "Инструмент(ы)",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "25 лет",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.grey[400],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Icon(
                                        shadows: <Shadow>[
                                          Shadow(
                                            color: Colors.lightBlueAccent,
                                            blurRadius: 10,
                                          ),
                                        ],
                                        Icons.play_arrow_rounded,
                                        color: Colors.lightBlueAccent[100],
                                        size: 28,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
    );
  }
}
