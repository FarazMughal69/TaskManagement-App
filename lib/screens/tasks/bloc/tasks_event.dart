// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class OnTaskInitialEvent extends TasksEvent {
  final List<Tasks> lst;
  const OnTaskInitialEvent({required this.lst});

  @override
  List<Object> get props => [lst];
}

class OnTaskSavedEvent extends TasksEvent {
  final List<Tasks> lst;
  const OnTaskSavedEvent({required this.lst});

  @override
  List<Object> get props => [lst];
}
