import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';

class GroupDetailsScreen extends StatefulWidget {
  final Group group;
  final User user;
  final VoidCallback onDelete;
  final VoidCallback onLeave;

  const GroupDetailsScreen({
    super.key,
    required this.group,
    required this.user,
    required this.onDelete,
    required this.onLeave,
  });

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupStyleController = TextEditingController();
  final TextEditingController _groupAboutController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _groupNameController.dispose();
    _groupStyleController.dispose();
    _groupAboutController.dispose();
    super.dispose();
  }

  // Функция для добавления участника в группу по email
  void _addMemberToGroup(String email) {
    setState(() {
      if (!(widget.group.users?.contains(email) ?? true)) {
        widget.group.users?.add(email);
      }
    });
  }

  // Функция для удаления участника из группы
  void _removeMemberFromGroup(String email) {
    setState(() {
      widget.group.users?.remove(email);
    });
  }

  // Функция для редактирования данных группы
  void _editGroup(String name, String style, String about) {
    setState(() {
      widget.group.name = name;
      widget.group.style = style;
      widget.group.about = about;
    });
  }

  // Диалоговое окно подтверждения
  Future<bool?> _showConfirmationDialog(String action, String target) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 28, 28, 38),
          title: Text(
            'Вы желаете $action "$target"?',
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

  // Модальное окно для добавления участника по email
  void _showAddMemberDialog() {
    _emailController.clear();
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
                'Добавить участника',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email участника',
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
                    if (_emailController.text.isNotEmpty) {
                      _addMemberToGroup(_emailController.text);
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
                    'Добавить',
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

  // Модальное окно для редактирования данных группы
  void _showEditGroupDialog() {
    _groupNameController.text = widget.group.name ?? '';
    _groupStyleController.text = widget.group.style ?? '';
    _groupAboutController.text = widget.group.about ?? '';

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
                'Редактировать группу',
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
                controller: _groupStyleController,
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
              const SizedBox(height: 16),
              TextField(
                controller: _groupAboutController,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Описание',
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
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_groupNameController.text.isNotEmpty &&
                        _groupStyleController.text.isNotEmpty) {
                      _editGroup(
                        _groupNameController.text,
                        _groupStyleController.text,
                        _groupAboutController.text,
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
                    'Сохранить',
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
    final isCreator = widget.group.creatorId == widget.user.email;

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
              widget.group.name ?? 'Без названия',
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
              if (isCreator)
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 158, 158, 184),
                  ),
                  onPressed: _showEditGroupDialog,
                ),
              IconButton(
                icon: Icon(
                  isCreator ? Icons.delete : Icons.close,
                  color: const Color.fromARGB(255, 158, 158, 184),
                ),
                onPressed: () async {
                  final confirm = await _showConfirmationDialog(
                    isCreator ? 'удалить' : 'выйти',
                    widget.group.name ?? 'Без названия',
                  );
                  if (confirm == true) {
                    if (isCreator) {
                      widget.onDelete();
                    } else {
                      widget.onLeave();
                    }
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Информация о группе
            Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                    widget.group.icon ?? 'assets/default_group_icon.png',
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.group.name ?? 'Без названия',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (isCreator) ...[
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 24,
                            shadows: [
                              Shadow(color: Colors.yellow, blurRadius: 10),
                            ],
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Жанр: ${widget.group.style ?? 'Не указан жанр'}',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 158, 158, 184),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Описание группы
            Text(
              'О группе',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.group.about?.isNotEmpty ?? false
                  ? widget.group.about!
                  : 'Описание отсутствует',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: const Color.fromARGB(255, 158, 158, 184),
              ),
            ),
            const SizedBox(height: 24),
            // Список участников
            Text(
              'Участники',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            widget.group.users?.isEmpty ?? true
                ? Text(
                  'Нет участников',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 158, 158, 184),
                  ),
                )
                : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.group.users?.length ?? 0,
                  itemBuilder: (context, index) {
                    final memberEmail = widget.group.users![index];
                    final isCurrentUser = memberEmail == widget.user.email;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            memberEmail,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 158, 158, 184),
                            ),
                          ),
                          if (isCreator && !isCurrentUser)
                            IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                                size: 20,
                              ),
                              onPressed: () async {
                                final confirm = await _showConfirmationDialog(
                                  'удалить участника',
                                  memberEmail,
                                );
                                if (confirm == true) {
                                  _removeMemberFromGroup(memberEmail);
                                }
                              },
                            ),
                        ],
                      ),
                    );
                  },
                ),
            const SizedBox(height: 24),
            // Кнопка добавления участника (только для создателя)
            if (isCreator)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showAddMemberDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 21, 21, 184),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Добавить участника',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
