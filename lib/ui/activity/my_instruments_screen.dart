import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/ui/element/basic_instrument_card.dart';

class MyInstrumentsScreen extends StatelessWidget {
  const MyInstrumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    shadows: [Shadow(color: Colors.white, blurRadius: 20)],
                  ),
                ),
              ),
            ],
            title: Text(
              "Мои инструменты",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 20)],
              ),
            ),
            backgroundColor: Color.fromARGB(255, 28, 28, 38),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
      body: Column(
        children: [
          BasicInstrumentCard(
            imagePath: "assets/forest.png",
            additionalInfo: "электрогитара",
            name: "gibsol lespoul",
            type: "hamdmade",
          ),
        ],
      ),
    );
  }
}
