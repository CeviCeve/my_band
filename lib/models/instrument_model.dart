import 'package:isar/isar.dart';
import 'package:my_band/enum/instruments.dart';
import 'package:my_band/enum/proficiency.dart';

part 'instrument_model.g.dart';

@Embedded()
class Instrument {
  late String name;
  String? manufacturer;

  @enumerated
  Instruments type = Instruments.bassetHorn;

  String? possessionTime;

  @enumerated
  Proficiency proficiencyLevel = Proficiency.Beginner;

  String? about;

  List<String>? instrumentPhoto;

  Instrument copyWith({
    String? name,
    String? manufacturer,
    Instruments? type,
    String? possessionTime,
    Proficiency? proficiencyLevel,
    String? about,
    List<String>? instrumentPhoto,
  }) {
    return Instrument()
      ..name = name ?? this.name
      ..manufacturer = manufacturer ?? this.manufacturer
      ..type = type ?? this.type
      ..possessionTime = possessionTime ?? this.possessionTime
      ..proficiencyLevel = proficiencyLevel ?? this.proficiencyLevel
      ..about = about ?? this.about
      ..instrumentPhoto = instrumentPhoto ?? this.instrumentPhoto;
  }
}
