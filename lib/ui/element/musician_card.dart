import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/ui/activity/group_detail_screen.dart';

class MusicianCard extends StatelessWidget {
  final GroupDetailsScreen group;
  final String? search;
  final String? location;
  const MusicianCard({
    super.key,
    required this.group,
    this.search,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => group,
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(0.0, 1.0);
              const end = Offset(0.0, 0.0);
              final tween = Tween(begin: begin, end: end);
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              );
              final offsetAnimation = curvedAnimation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      },
      child: ClipRRect(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        group.group.name ?? "Metallica",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        location ?? "Los-Angeles",
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
                                          "Инструмент(ы): ${search ?? "электрогитара"}",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "45 лет",
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
      ),
    );
  }
}
