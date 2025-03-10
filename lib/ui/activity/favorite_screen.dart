import 'package:flutter/material.dart';
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
              itemCount: 10,
              itemBuilder: (context, index) => MusicianCard(),
            ),
          ),
        ],
      ),
    );
  }
}
