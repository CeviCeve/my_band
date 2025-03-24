import 'package:my_band/data/dto_pattern/models/local/contact_model.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/instrument_model.dart';
import 'package:my_band/data/dto_pattern/models/local/location_model.dart';
import 'package:my_band/data/dto_pattern/models/local/proficiency_level_model.dart';

class User {
  String name;
  String? surname;
  DateTime? dob;
  String email;
  String password;
  String? education;
  String? status;
  String? likeBand;
  String? about;
  List<Instrument> instruments;
  List<Group> groups;
  List<Contact> contacts;
  List<ProficiencyLevel> proficiencyLevel;
  String userCode;
  String? icon;
  String? background;
  Location? location;

  User({
    required this.name,
    this.surname,
    this.dob,
    required this.email,
    required this.password,
    this.education,
    this.status,
    this.likeBand,
    this.about,
    this.instruments = const [],
    this.groups = const [], // Инициализировано как пустой список
    this.contacts = const [],
    this.proficiencyLevel = const [],
    required this.userCode,
    this.icon,
    this.background,
    this.location,
  });

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
    List<Group>? groups, // Изменено на List<Group>
    List<Contact>? contacts,
    List<ProficiencyLevel>? proficiencyLevel,
    String? userCode,
    String? icon,
    String? background,
    Location? location,
  }) {
    return User(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      password: password ?? this.password,
      education: education ?? this.education,
      status: status ?? this.status,
      likeBand: likeBand ?? this.likeBand,
      about: about ?? this.about,
      instruments: instruments ?? this.instruments,
      groups: groups ?? this.groups, // Теперь List<Group>
      contacts: contacts ?? this.contacts,
      proficiencyLevel: proficiencyLevel ?? this.proficiencyLevel,
      userCode: userCode ?? this.userCode,
      icon: icon ?? this.icon,
      background: background ?? this.background,
      location: location ?? this.location,
    );
  }
}
