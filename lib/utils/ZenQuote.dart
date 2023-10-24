class ZenQuote {
  final String text;
  final String author;

  ZenQuote({required this.text, required this.author});

  factory ZenQuote.fromJson(Map<String, dynamic> json) {
    return ZenQuote(
      text: json['q'] ?? '',
      author: json['a'] ?? '',
    );
  }
}
