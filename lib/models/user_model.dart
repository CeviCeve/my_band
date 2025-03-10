import 'package:isar/isar.dart';
import 'package:my_band/models/contact_model.dart';
import 'package:my_band/models/group_model.dart';
import 'package:my_band/models/instrument_model.dart';
import 'package:my_band/models/location_model.dart';
import 'package:my_band/models/proficiency_level_model.dart';

part 'user_model.g.dart';

// Класс пользователя
@Collection()
class User {
  Id id = Isar.autoIncrement;

  late String name;
  String? surname;
  DateTime? dob;
  late String email;
  late String password;
  String? education;
  String? status;
  String? likeBand;
  String? about;

  List<Instrument> instruments = [];
  IsarLinks<Group> groups = IsarLinks();
  List<Contact> contacts = [];

  List<ProficiencyLevel> proficiencyLevel = [];
  late String userCode;
  String? icon;
  String? background;
  Location? location;

  User copyWith({
    String? name,
    String? surname,
    DateTime? dob,
    String? email,
    String? password,
    String? education,
    String? status,
    String? likeBand,
    String? about,
    List<Instrument>? instruments,
    IsarLinks<Group>? groups,
    List<Contact>? contacts,
    List<ProficiencyLevel>? proficiencyLevel,
    String? userCode,
    String? icon,
    String? background,
    Location? location,
  }) {
    return User()
      ..id = id
      ..name = name ?? this.name
      ..surname = surname ?? this.surname
      ..dob = dob ?? this.dob
      ..email = email ?? this.email
      ..password = password ?? this.password
      ..education = education ?? this.education
      ..status = status ?? this.status
      ..likeBand = likeBand ?? this.likeBand
      ..about = about ?? this.about
      ..instruments = instruments ?? this.instruments
      ..groups = groups ?? this.groups
      ..contacts = contacts ?? this.contacts
      ..proficiencyLevel = proficiencyLevel ?? this.proficiencyLevel
      ..userCode = userCode ?? this.userCode
      ..icon = icon ?? this.icon
      ..background = background ?? this.background
      ..location = location ?? this.location;
  }
}
