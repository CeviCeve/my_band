import 'package:isar/isar.dart';

part 'location_model.g.dart';

@Embedded()
class Location {
  late String? country;
  late String? district;
  late String? city;

  String get getLocation {
    return "${country == null ? "" : "$country"}"
        "${district == null ? "" : ", $district"}"
        "${city == null ? "" : ", $city"}";
  }
}
