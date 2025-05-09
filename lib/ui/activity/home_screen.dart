import 'package:flutter/material.dart';
import 'package:my_band/ui/activity/groups/search_screen.dart';
import 'package:my_band/ui/element/custom/custom_button_large.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 23),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65, child: Image.asset("assets/my_band.png")),

            CustomButton(
              text: 'Найти группу',
              function:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchGroupScreen(),
                    ),
                  ),
            ),
            CustomButton(text: 'Найти музыканта'),
            CustomButton(text: 'Реп-точки'),
          ],
        ),
      ),
    );
  }
}
