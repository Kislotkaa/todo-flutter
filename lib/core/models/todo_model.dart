import 'dart:convert';

class ToDoModel {
  final String id;
  late String title;
  late String description;
  late bool isActive;

  ToDoModel({
    required this.id,
    required this.title,
    required this.description,
    this.isActive = true,
  });

  ToDoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isActive,
  }) {
    return ToDoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'isActive': isActive});

    return result;
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) => ToDoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ToDoModel(id: $id, title: $title, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToDoModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ description.hashCode ^ isActive.hashCode;
  }
}
