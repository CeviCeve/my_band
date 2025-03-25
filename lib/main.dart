import 'package:flutter/material.dart';
import 'package:my_band/data/servise/user_preferences.dart';
import 'package:my_band/ui/activity/login_screen.dart';
import 'package:my_band/ui/element/custom/custom_bottom_nav_bar.dart';

Future<void> main() async {
  bool isLoggedIn = await UserPreferences.isUserLoggedIn();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: isLoggedIn ? CustomBottomNavBar() : LoginScreen(),
    ),
  );
}
