import 'package:flutter/material.dart';
import 'package:my_band/data/dto_pattern/models/global_data.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/ui/activity/group_detail_screen.dart';
import 'package:my_band/ui/element/musician_card.dart';
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
              itemCount: 1,
              itemBuilder:
                  (context, index) => MusicianCard(
                    group: GroupDetailsScreen(
                      user: GlobalData.user,
                      group: Group(
                        name: "Metallica",
                        creatorId: "@gmail.com",
                        style: "Trash-Metal",
                        about: "The most popular trash-metall band ",
                        users: [
                          "James Hetfild",
                          "Kirk Hemmet",
                          "Lars Ulrich",
                          "Cliff Berton",
                        ],
                      ),
                      onDelete: () {},
                      onLeave: () {},
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
