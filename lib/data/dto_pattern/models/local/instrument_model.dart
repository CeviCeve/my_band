import 'package:my_band/data/enum/instruments.dart';
import 'package:my_band/data/enum/proficiency.dart';

class Instrument {
  String name;
  String? manufacturer;
  Instruments type;
  String? possessionTime;
  Proficiency proficiencyLevel;
  String? about;
  List<String>? instrumentPhoto;

  Instrument({
    required this.name,
    this.manufacturer,
    this.type = Instruments.bassetHorn,
    this.possessionTime,
    this.proficiencyLevel = Proficiency.Beginner,
    this.about,
    this.instrumentPhoto,
  });

  Instrument copyWith({
    String? name,
    String? manufacturer,
    Instruments? type,
    String? possessionTime,
    Proficiency? proficiencyLevel,
    String? about,
    List<String>? instrumentPhoto,
  }) {
    return Instrument(
      name: name ?? this.name,
      manufacturer: manufacturer ?? this.manufacturer,
      type: type ?? this.type,
      possessionTime: possessionTime ?? this.possessionTime,
      proficiencyLevel: proficiencyLevel ?? this.proficiencyLevel,
      about: about ?? this.about,
      instrumentPhoto: instrumentPhoto ?? this.instrumentPhoto,
    );
  }
}
