class DbModel{
  final String name;
  final String title;
  DbModel({
    required this.name,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
    };
  }
}