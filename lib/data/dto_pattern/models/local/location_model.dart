class Location {
  String? country;
  String? district;
  String? city;

  String get getLocation {
    return "${country == null ? "" : "$country"}"
        "${district == null ? "" : ", $district"}"
        "${city == null ? "" : ", $city"}";
  }
}
