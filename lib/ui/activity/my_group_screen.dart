import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';
import 'package:my_band/ui/activity/group_detail_screen.dart';

class MyGroupsScreen extends StatefulWidget {
  final User user;

  const MyGroupsScreen({super.key, required this.user});

  @override
  State<MyGroupsScreen> createState() => _MyGroupsScreenState();
}

class _MyGroupsScreenState extends State<MyGroupsScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupGenreController = TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupGenreController.dispose();
    super.dispose();
  }

  // Функция для добавления новой группы
  void _addGroup(String name, String style) {
    setState(() {
      widget.user.groups.add(
        Group(
          name: name,
          style: style,
          creatorId: widget.user.email ?? '',
          about: '',
          users: [widget.user.email ?? ''],
          icon: 'assets/default_group_icon.png',
        ),
      );
    });
  }

  // Функция для удаления группы
  void _deleteGroup(int index) {
    setState(() {
      widget.user.groups.removeAt(index);
    });
  }

  // Функция для выхода из группы
  void _leaveGroup(int index) {
    setState(() {
      widget.user.groups[index].users?.remove(widget.user.email);
      if (widget.user.groups[index].users?.isEmpty ?? true) {
        widget.user.groups.removeAt(index);
      }
    });
  }

  // Диалоговое окно подтверждения
  Future<bool?> _showConfirmationDialog(String action, String groupName) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 28, 28, 38),
          title: Text(
            'Вы желаете $action из группы "$groupName"?',
            style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Отмена',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 158, 158, 184),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Да',
                style: GoogleFonts.montserrat(fontSize: 14, color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // Модальное окно для создания новой группы
  void _showAddGroupDialog() {
    _groupNameController.clear();
    _groupGenreController.clear();
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 28, 28, 38),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Создать группу',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _groupNameController,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Название группы',
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
              TextField(
                controller: _groupGenreController,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Жанр',
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_groupNameController.text.isNotEmpty &&
                        _groupGenreController.text.isNotEmpty) {
                      _addGroup(
                        _groupNameController.text,
                        _groupGenreController.text,
                      );
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
                    'Создать',
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
      backgroundColor: const Color.fromARGB(255, 18, 18, 23),
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
              "Мои группы",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 20)],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 28, 28, 38),
            foregroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _showAddGroupDialog,
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.user.groups.length ?? 0,
        itemBuilder: (context, index) {
          final group = widget.user.groups[index];
          final isCreator = group.creatorId == widget.user.email;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => GroupDetailsScreen(
                        group: group,
                        user: widget.user,
                        onDelete: () => _deleteGroup(index),
                        onLeave: () => _leaveGroup(index),
                      ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 28, 38),
                  border: const Border(
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
                            group.icon ?? 'assets/default_group_icon.png',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  group.name ?? 'Без названия',
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
                                      Shadow(
                                        color: Colors.yellow,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              group.users?.join(', ') ?? 'Нет участников',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 158, 158, 184),
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
                      onPressed: () async {
                        final confirm = await _showConfirmationDialog(
                          isCreator ? 'удалить' : 'выйти',
                          group.name ?? 'Без названия',
                        );
                        if (confirm == true) {
                          if (isCreator) {
                            _deleteGroup(index);
                          } else {
                            _leaveGroup(index);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
