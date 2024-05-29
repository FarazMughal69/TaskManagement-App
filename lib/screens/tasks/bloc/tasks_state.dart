// ignore_for_file: must_be_immutable

part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

abstract class TaskActionState extends TasksState {}

final class TasksInitialState extends TasksState {
  List<Tasks> tasks = allTasklst;
  TasksInitialState({required this.tasks});
}

final class OnTaskSavedState extends TasksState {
  List<Tasks> tasks = allTasklst;
  OnTaskSavedState({required this.tasks});
}
