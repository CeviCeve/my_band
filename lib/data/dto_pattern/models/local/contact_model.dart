class Contact {
  String? name;
  String? inside;
  bool? visibility;

  Contact({this.name, this.inside, this.visibility});

  Contact copyWith({String? name, String? inside, bool? visibility}) {
    return Contact(
      name: name ?? this.name,
      inside: inside ?? this.inside,
      visibility: visibility ?? this.visibility,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'inside': inside, 'visibility': visibility};
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'] as String?,
      inside: json['inside'] as String?,
      visibility: json['visibility'] as bool?,
    );
  }
}
