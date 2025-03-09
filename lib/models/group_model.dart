import 'package:isar/isar.dart';
import 'package:my_band/models/contact_model.dart';

part 'group_model.g.dart';

@Collection()
class Group {
  Id id = Isar.autoIncrement;

  List<String>? users;
  late String name;
  String? style;
  late String creatorId;
  String? icon;
  String? about;
  List<Contact>? contacts;

  Group copyWith({
    List<String>? users,
    String? name,
    String? style,
    String? creatorId,
    String? icon,
    String? about,
    List<Contact>? contacts,
  }) {
    return Group()
      ..id = id
      ..users = users ?? this.users
      ..name = name ?? this.name
      ..style = style ?? this.style
      ..creatorId = creatorId ?? this.creatorId
      ..icon = icon ?? this.icon
      ..about = about ?? this.about
      ..contacts = contacts ?? this.contacts;
  }
}
