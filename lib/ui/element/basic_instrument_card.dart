import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_band/data/dto_pattern/models/global_data.dart';
import 'package:my_band/data/dto_pattern/models/local/instrument_model.dart';
import 'package:my_band/ui/activity/instruments/instruments_profile_screen.dart';
import 'package:my_band/ui/helper/anim_helper.dart';

class BasicInstrumentCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String type;
  final String additionalInfo;
  final Instrument instrument;

  const BasicInstrumentCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.type,
    required this.additionalInfo,
    required this.instrument,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: InkWell(
        onTap:
            () => AnimHelper.slideBottomToTop(
              InstrumentProfileScreen(
                user: GlobalData.user,
                instrument: instrument,
              ),
              context,
            ),
        focusColor: Colors.transparent,
        child: Container(
          height: 66,
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 28, 28, 38),
            border: const Border(
              top: BorderSide(color: Color.fromARGB(255, 41, 41, 56)),
              bottom: BorderSide(color: Color.fromARGB(255, 41, 41, 56)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 11, 16, 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(imagePath),
                  backgroundColor: Colors.black,
                  onBackgroundImageError: (exception, stackTrace) {},
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),

                            Text(
                              type,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 158, 158, 184),
                              ),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),

                        Text(
                          additionalInfo,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: const Color.fromARGB(255, 158, 158, 184),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
