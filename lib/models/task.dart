import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class task extends Equatable{
  final String title;
  bool? isDone;
  bool? isDeleted;
  task({
    required this.title,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory task.fromMap(Map<String, dynamic> map) {
    return task(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory task.fromJson(String source) => task.fromMap(json.decode(source) as Map<String, dynamic>);
  
  @override
  // TODO: implement props
  List<Object?> get props => [title,isDeleted,isDone];
}
