import 'package:my_band/data/dto_pattern/models/local/contact_model.dart';

class Group {
  List<String>? users;
  String name;
  String? style;
  String creatorId;
  String? icon;
  String? about;
  List<Contact>? contacts;

  Group({
    this.users,
    required this.name,
    this.style,
    required this.creatorId,
    this.icon,
    this.about,
    this.contacts,
  });

  Group copyWith({
    List<String>? users,
    String? name,
    String? style,
    String? creatorId,
    String? icon,
    String? about,
    List<Contact>? contacts,
  }) {
    return Group(
      users: users ?? this.users,
      name: name ?? this.name,
      style: style ?? this.style,
      creatorId: creatorId ?? this.creatorId,
      icon: icon ?? this.icon,
      about: about ?? this.about,
      contacts: contacts ?? this.contacts,
    );
  }
}
