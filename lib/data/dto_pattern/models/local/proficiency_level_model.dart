import 'package:my_band/data/enum/instruments.dart';
import 'package:my_band/data/enum/proficiency.dart';

class ProficiencyLevel {
  Instruments instrument;
  Proficiency level;

  ProficiencyLevel({
    this.instrument = Instruments.bassetHorn,
    this.level = Proficiency.Beginner,
  });

  Map<String, dynamic> toJson() {
    return {'instrument': instrument.name, 'level': level.name};
  }

  factory ProficiencyLevel.fromJson(Map<String, dynamic> json) {
    return ProficiencyLevel(
      instrument: Instruments.values.firstWhere(
        (e) => e.name == json['instrument'],
        orElse: () => Instruments.bassetHorn,
      ),
      level: Proficiency.values.firstWhere(
        (e) => e.name == json['level'],
        orElse: () => Proficiency.Beginner,
      ),
    );
  }
}
