import 'package:isar/isar.dart';

part 'contact_model.g.dart';

@Embedded()
class Contact {
  String? name;
  String? inside;
  bool? visibility;

  Contact copyWith({String? name, String? inside, bool? visibility}) {
    return Contact()
      ..name = name ?? this.name
      ..inside = inside ?? this.inside
      ..visibility = visibility ?? this.visibility;
  }
}
