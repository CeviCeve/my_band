import 'package:flutter/material.dart';
import 'package:my_band/servise/user_preferences.dart';
import 'package:my_band/ui/activity/registration_screen.dart';
import 'package:my_band/ui/element/custom/custom_bottom_nav_bar.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:
          await UserPreferences.isUserLoggedIn()
              ? RegistrationScreen()
              : CustomBottomNavBar(),
    ),
  );
}
