class Nota {
  final int id;
  final String title;
  final String content;

  Nota({required this.id, required this.title, required this.content});

  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(id: json['id'], title: json['title'], content: json['content']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content};
  }
}
