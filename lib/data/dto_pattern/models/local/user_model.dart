import 'package:my_band/data/dto_pattern/models/local/contact_model.dart';
import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/instrument_model.dart';
import 'package:my_band/data/dto_pattern/models/local/location_model.dart';
import 'package:my_band/data/dto_pattern/models/local/proficiency_level_model.dart';

class User {
  String name;
  String? surname;
  String? dob;
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
    List<Instrument>? instruments,
    List<Group>? groups,
    List<Contact>? contacts,
    List<ProficiencyLevel>? proficiencyLevel,
    required this.userCode,
    this.icon,
    this.background,
    this.location,
  }) : instruments = instruments ?? [],
       groups = groups ?? [],
       contacts = contacts ?? [],
       proficiencyLevel = proficiencyLevel ?? [];

  // Метод для сериализации объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'dob': dob,
      'email': email,
      'password': password,
      'education': education,
      'status': status,
      'likeBand': likeBand,
      'about': about,
      'instruments':
          instruments.map((instrument) => instrument.toJson()).toList(),
      'groups': groups.map((group) => group.toJson()).toList(),
      'contacts': contacts.map((contact) => contact.toJson()).toList(),
      'proficiencyLevel':
          proficiencyLevel.map((level) => level.toJson()).toList(),
      'userCode': userCode,
      'icon': icon,
      'background': background,
      'location': location?.toJson(),
    };
  }

  // Фабричный метод для десериализации из JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '', // Если null, то пустая строка
      surname: json['surname'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      education: json['education'] as String?,
      status: json['status'] as String?,
      likeBand: json['likeBand'] as String?,
      about: json['about'] as String?,
      instruments:
          (json['instruments'] as List<dynamic>?)
              ?.map((item) => Instrument.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      groups:
          (json['groups'] as List<dynamic>?)
              ?.map((item) => Group.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      contacts:
          (json['contacts'] as List<dynamic>?)
              ?.map((item) => Contact.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      proficiencyLevel:
          (json['proficiencyLevel'] as List<dynamic>?)
              ?.map(
                (item) =>
                    ProficiencyLevel.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
      userCode: json['userCode'] ?? '',
      icon: json['icon'] as String?,
      background: json['background'] as String?,
      location:
          json['location'] != null
              ? Location.fromJson(json['location'] as Map<String, dynamic>)
              : null,
    );
  }

  User copyWith({
    String? name,
    String? surname,
    String? dob,
    String? email,
    String? password,
    String? education,
    String? status,
    String? likeBand,
    String? about,
    List<Instrument>? instruments,
    List<Group>? groups,
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
      instruments:
          instruments != null ? List.from(instruments) : this.instruments,
      groups: groups != null ? List.from(groups) : this.groups,
      contacts: contacts != null ? List.from(contacts) : this.contacts,
      proficiencyLevel:
          proficiencyLevel != null
              ? List.from(proficiencyLevel)
              : this.proficiencyLevel,
      userCode: userCode ?? this.userCode,
      icon: icon ?? this.icon,
      background: background ?? this.background,
      location: location ?? this.location,
    );
  }
}
