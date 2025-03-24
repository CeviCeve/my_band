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
}
