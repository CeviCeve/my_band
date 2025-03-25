import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/global_data.dart';
import 'package:my_band/data/servise/decoder.dart';
import 'package:my_band/ui/activity/instruments/instruments_profile_screen.dart';
import 'package:my_band/ui/element/basic_instrument_card.dart';

class MyInstrumentsScreen extends StatefulWidget {
  const MyInstrumentsScreen({super.key});

  @override
  State<MyInstrumentsScreen> createState() => _MyInstrumentsScreenState();
}

class _MyInstrumentsScreenState extends State<MyInstrumentsScreen> {
  EnumDecoder decoder = EnumDecoder();
  @override
  Widget build(BuildContext context) {
    // Проверяем, есть ли текущий пользователь
    final instruments = GlobalData.user.instruments ?? [];

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
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                  onPressed: () {
                    // Открываем экран добавления нового инструмента
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                InstrumentProfileScreen(user: GlobalData.user),
                      ),
                    ).then((_) {
                      // Обновляем UI после возвращения
                      setState(() {});
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    shadows: const [
                      Shadow(color: Colors.white, blurRadius: 20),
                    ],
                  ),
                ),
              ),
            ],
            title: Text(
              "Мои инструменты",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                shadows: const <Shadow>[
                  Shadow(color: Colors.white, blurRadius: 20),
                ],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 28, 28, 38),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
      body:
          instruments.isEmpty
              ? Center(
                child: Text(
                  'Тут пусто',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 158, 158, 184),
                  ),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: instruments.length,
                itemBuilder: (context, index) {
                  final instrument = instruments[index];
                  return BasicInstrumentCard(
                    instrument: GlobalData.user.instruments[index],
                    imagePath:
                        instrument.instrumentPhoto?.isNotEmpty ?? false
                            ? instrument.instrumentPhoto!.first
                            : "assets/forest.png",
                    additionalInfo:
                        decoder.instrumentDecoder(instrument.type) ??
                        'Не указан тип',
                    name: instrument.name ?? 'Без названия',
                    type: instrument.manufacturer ?? 'Не указан производитель',
                  );
                },
              ),
    );
  }
}
