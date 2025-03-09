import 'package:flutter/material.dart';
import 'package:my_band/ui/element/custom_bottom_nav_bar.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CustomBottomNavBar(),
    ),
  );
}
