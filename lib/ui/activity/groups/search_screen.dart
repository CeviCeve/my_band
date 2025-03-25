import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/global_data.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/ui/activity/group_detail_screen.dart';
import 'package:my_band/ui/element/musician_card.dart';

class SearchGroupScreen extends StatelessWidget {
  const SearchGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> search = ["электрогитара", "клавишные", "барабаны"];
    final List<String> location = ["USA", "UK", "UK"];
    final List<Group> groups = [
      Group(
        name: "Nirvana",
        creatorId: "@gmail.com",
        style: "Grunge",
        about: "Legendary grunge band",
        users: ["Kurt Cobain", "Krist Novoselic", "Dave Grohl"],
      ),
      Group(
        name: "Pink Floyd",
        creatorId: "@gmail.com",
        style: "Progressive Rock",
        about: "Iconic psychedelic rock band",
        users: [
          "David Gilmour",
          "Roger Waters",
          "Nick Mason",
          "Richard Wright",
        ],
      ),
      Group(
        name: "Led Zeppelin",
        creatorId: "@gmail.com",
        style: "Hard Rock",
        about: "Pioneers of hard rock and heavy metal",
        users: ["Robert Plant", "Jimmy Page", "John Paul Jones", "John Bonham"],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121217),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121217),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Группы",
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return MusicianCard(
            search: search[index],
            location: location[index],
            group: GroupDetailsScreen(
              user: GlobalData.user,
              group: group,
              onDelete: () {},
              onLeave: () {},
            ),
          );
        },
      ),
    );
  }
}
