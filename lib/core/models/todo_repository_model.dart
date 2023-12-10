import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:todo_flutter/core/models/todo_model.dart';

class ToDoRepositoryModel {
  final List<ToDoModel> list;
  final int countToDo;

  ToDoRepositoryModel({
    required this.list,
    required this.countToDo,
  });

  ToDoRepositoryModel copyWith({
    List<ToDoModel>? list,
    int? countToDo,
  }) {
    return ToDoRepositoryModel(
      list: list ?? this.list,
      countToDo: countToDo ?? this.countToDo,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'list': list.map((x) => x.toMap()).toList()});
    result.addAll({'countToDo': countToDo});

    return result;
  }

  factory ToDoRepositoryModel.fromMap(Map<String, dynamic> map) {
    return ToDoRepositoryModel(
      list: List<ToDoModel>.from(map['list']?.map((x) => ToDoModel.fromMap(x))),
      countToDo: map['countToDo']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoRepositoryModel.fromJson(String source) => ToDoRepositoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'ToDoRepositoryModel(list: $list, countToDo: $countToDo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToDoRepositoryModel && listEquals(other.list, list) && other.countToDo == countToDo;
  }

  @override
  int get hashCode => list.hashCode ^ countToDo.hashCode;
}
