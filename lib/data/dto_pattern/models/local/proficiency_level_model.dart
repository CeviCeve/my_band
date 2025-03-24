import 'package:my_band/data/enum/instruments.dart';
import 'package:my_band/data/enum/proficiency.dart';

class ProficiencyLevel {
  Instruments instrument;
  Proficiency level;

  ProficiencyLevel({
    this.instrument = Instruments.bassetHorn,
    this.level = Proficiency.Beginner,
  });
}
