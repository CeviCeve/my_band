import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';

class GroupCard extends StatelessWidget {
  final Group group;
  final User user;
  final VoidCallback onTap;
  final VoidCallback onDeleteOrLeave;

  const GroupCard({
    super.key,
    required this.group,
    required this.user,
    required this.onTap,
    required this.onDeleteOrLeave,
  });

  @override
  Widget build(BuildContext context) {
    final isCreator = group.creatorId == user.email;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 28, 28, 38),
          border: Border(
            top: BorderSide(color: Color.fromARGB(255, 41, 41, 56)),
            bottom: BorderSide(color: Color.fromARGB(255, 41, 41, 56)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                    group.icon ?? 'assets/my_band.png',
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          group.name,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        if (isCreator) ...[
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                            shadows: [
                              Shadow(color: Colors.yellow, blurRadius: 10),
                            ],
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width -
                          150, // Ограничение ширины для текста участников
                      child: Text(
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        group.users?.join(', ') ?? 'Нет участников',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 158, 158, 184),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      group.style ?? 'Не указан жанр',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 158, 158, 184),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                isCreator ? Icons.delete : Icons.close,
                color: const Color.fromARGB(255, 158, 158, 184),
              ),
              onPressed: onDeleteOrLeave,
            ),
          ],
        ),
      ),
    );
  }
}
