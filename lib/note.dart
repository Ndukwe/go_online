// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Note welcomeFromJson(String str) => Note.fromJson(json.decode(str));

String welcomeToJson(Note data) => json.encode(data.toJson());

class Note {
  String title;
  String content;
  DateTime updatedAt;

  Note({
    required this.title,
    required this.content,
    required this.updatedAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    title: json["title"],
    content: json["content"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "updatedAt": updatedAt.toIso8601String(),
  };
}
