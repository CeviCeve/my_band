import 'package:isar/isar.dart';

part 'location_model.g.dart';

@Embedded()
class Location {
  late String? country;
  late String? district;
  late String? city;
}
