class Location {
  String? country;
  String? district;
  String? city;

  Location({this.country, this.district, this.city});

  String get getLocation {
    return "${country == null ? "" : "$country"}"
        "${district == null ? "" : ", $district"}"
        "${city == null ? "" : ", $city"}";
  }

  Map<String, dynamic> toJson() {
    return {'country': country, 'district': district, 'city': city};
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'] as String?,
      district: json['district'] as String?,
      city: json['city'] as String?,
    );
  }
}
