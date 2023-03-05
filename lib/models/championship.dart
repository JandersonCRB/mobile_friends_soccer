class Championship {
  final String? name;

  Championship({this.name});

  factory Championship.fromJson(Map<String, dynamic> json) {
    return Championship(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'name': name,
      };
}