import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tasks extends Equatable {
  final DateTime dateTime;
  final String title;
  final String assignBy;
  final String assignTo;
  final String description;
  String? taskStatus;
  bool? isDone;
  bool? isDeleted;
  Tasks({
    required this.dateTime,
    required this.title,
    required this.assignBy,
    required this.assignTo,
    required this.description,
    this.isDone,
    this.isDeleted,
    this.taskStatus,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    taskStatus = taskStatus ?? 'Todo';
  }
  // const Tasks({});

  Tasks copyWith({
    DateTime? dateTime,
    String? title,
    String? assignBy,
    String? assignTo,
    required String description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Tasks(
      dateTime: dateTime ?? this.dateTime,
      title: title ?? this.title,
      assignBy: assignBy ?? this.assignBy,
      assignTo: assignTo ?? this.assignTo,
      description: description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTime': dateTime,
      'title': title,
      'assignBy': assignBy,
      'assignTo': assignTo,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      dateTime: map['dateTime'] as DateTime,
      title: map['title'] as String,
      assignBy: map['assignBy'] as String,
      assignTo: map['assignTo'] as String,
      description: map['description'],
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        assignBy,
        assignTo,
        description,
        isDone,
        isDeleted,
      ];
}
