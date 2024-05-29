// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeIntialEvent extends HomeEvent {
  final List<Tasks> task;
  const HomeIntialEvent({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class AddTaskEvent extends HomeEvent {
  final List<Tasks> tasks;
  const AddTaskEvent({
    required this.tasks,
  });

  @override
  List<Object> get props => [tasks];
}

class TaskLoadingEvent extends HomeEvent {}

class TaskAddedSuccessEvent extends HomeEvent {}
// class UpdateTaskEvent extends HomeEvent {
//   final List<Tasks> tasks;
//   const UpdateTaskEvent({
//     required this.tasks,
//   });

//   @override
//   List<Object> get props => [tasks];
// }

// class DeleteTaskEvent extends HomeEvent {
//   final List<Tasks> tasks;
//   const DeleteTaskEvent({
//     required this.tasks,
//   });

//   @override
//   List<Object> get props => [tasks];
// }

// class OnTaskListClickEvent extends HomeEvent {
//   final List<Tasks> tasks;
//   const OnTaskListClickEvent({
//     required this.tasks,
//   });

//   @override
//   List<Object> get props => [tasks];
// }
