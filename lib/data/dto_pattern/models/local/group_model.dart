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

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'name': name,
      'style': style,
      'creatorId': creatorId,
      'icon': icon,
      'about': about,
      'contacts': contacts?.map((contact) => contact.toJson()).toList(),
    };
  }

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      users: (json['users'] as List<dynamic>?)?.cast<String>(),
      name: json['name'] as String,
      style: json['style'] as String?,
      creatorId: json['creatorId'] as String,
      icon: json['icon'] as String?,
      about: json['about'] as String?,
      contacts:
          (json['contacts'] as List<dynamic>?)
              ?.map((item) => Contact.fromJson(item as Map<String, dynamic>))
              .toList(),
    );
  }
}
