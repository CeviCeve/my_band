import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/ui/activity/home_screen.dart';
import 'package:my_band/ui/element/search_element.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Scaffold(body: SearchElement(controller: TextEditingController())),
    Text("ерукв"),
  ];

  void selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 23),
      body: Center(
        heightFactor: 73,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromARGB(255, 41, 41, 56), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 28, 28, 38),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 158, 158, 184),
          selectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ],
          ),
          unselectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
          currentIndex: _selectedIndex,
          onTap: selectTab,
        ),
      ),
    );
  }
}
