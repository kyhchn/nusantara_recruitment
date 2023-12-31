import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  final String isbn;
  final String title;
  final String subtitle;
  final String author;
  final DateTime published;
  final String publisher;
  final int pages;
  final String description;
  final String website;
  final int userId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Book({
    required this.isbn,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.published,
    required this.publisher,
    required this.pages,
    required this.description,
    required this.website,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: DateTime.parse(json["published"]),
        publisher: json["publisher"],
        pages: int.parse(json["pages"].toString()),
        description: json["description"],
        website: json["website"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published":
            "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
      };
}
