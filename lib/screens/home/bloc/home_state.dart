// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeIntialState extends HomeState {}

abstract class HomeActionState extends HomeState {}

class TaskLoadingState extends HomeState {
  // List<Tasks> tasklst;
  // TaskLoadingState({
  //   required this.tasklst,
  // });
}

class TaskAddedListState extends HomeState {
  List<Tasks> tasklst;
  TaskAddedListState({
    required this.tasklst,
  });
  // @override
  // List<Object> get props => [tasklst];
}

class TaskAddedSuccessState extends HomeState {}
