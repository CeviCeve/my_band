import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';
import 'package:my_band/ui/activity/group_detail_screen.dart';
import 'package:my_band/ui/element/add_group_dialog.dart';
import 'package:my_band/ui/element/confirmation_dialog.dart';
import 'package:my_band/ui/element/group_card.dart';
import 'package:my_band/ui/helper/anim_helper.dart';

class MyGroupsScreen extends StatefulWidget {
  final User user;

  const MyGroupsScreen({super.key, required this.user});

  @override
  State<MyGroupsScreen> createState() => _MyGroupsScreenState();
}

class _MyGroupsScreenState extends State<MyGroupsScreen> {
  // Функция для добавления новой группы
  void _addGroup(String name, String style) {
    setState(() {
      widget.user.groups.add(
        Group(
          name: name,
          style: style,
          creatorId: widget.user.email,
          about: '',
          users: [widget.user.email],
          icon: 'assets/my_band.png',
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
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: const Color.fromARGB(255, 28, 28, 38),
                    builder: (context) => AddGroupDialog(onAddGroup: _addGroup),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        // Убраны отступы справа и слева
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: widget.user.groups.length,
        itemBuilder: (context, index) {
          final group = widget.user.groups[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: GroupCard(
              group: group,
              user: widget.user,
              onTap: () {
                AnimHelper.slideBottomToTop(
                  GroupDetailsScreen(
                    group: group,
                    user: widget.user,
                    onDelete: () => _deleteGroup(index),
                    onLeave: () => _leaveGroup(index),
                  ),
                  context,
                );
              },
              onDeleteOrLeave: () async {
                final confirm = await ConfirmationDialog.show(
                  context: context,
                  action:
                      group.creatorId == widget.user.email
                          ? 'удалить'
                          : 'выйти',
                  groupName: group.name ?? 'Без названия',
                );
                if (confirm == true) {
                  if (group.creatorId == widget.user.email) {
                    _deleteGroup(index);
                  } else {
                    _leaveGroup(index);
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
