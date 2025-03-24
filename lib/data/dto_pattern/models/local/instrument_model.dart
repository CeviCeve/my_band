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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'manufacturer': manufacturer,
      'type': type.name,
      'possessionTime': possessionTime,
      'proficiencyLevel': proficiencyLevel.name,
      'about': about,
      'instrumentPhoto': instrumentPhoto,
    };
  }

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String?,
      type: Instruments.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => Instruments.bassetHorn,
      ),
      possessionTime: json['possessionTime'] as String?,
      proficiencyLevel: Proficiency.values.firstWhere(
        (e) => e.name == json['proficiencyLevel'],
        orElse: () => Proficiency.Beginner,
      ),
      about: json['about'] as String?,
      instrumentPhoto:
          (json['instrumentPhoto'] as List<dynamic>?)?.cast<String>(),
    );
  }
}
