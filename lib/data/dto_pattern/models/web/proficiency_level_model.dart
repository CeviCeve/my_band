import 'package:isar/isar.dart';
import 'package:my_band/data/enum/instruments.dart';
import 'package:my_band/data/enum/proficiency.dart';

part 'proficiency_level_model.g.dart';

@Embedded()
class ProficiencyLevel {
  @enumerated
  Instruments instrument = Instruments.bassetHorn;
  @enumerated
  Proficiency level = Proficiency.Beginner;
}
