// import 'dart:async';

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data_model/tasks_data_models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeIntialEvent>(_homeIntialEvent);
    on<AddTaskEvent>(_addTaskEvent);
  }

  Future<FutureOr<void>> _homeIntialEvent(
      HomeIntialEvent event, Emitter<HomeState> emit) async {
    emit(TaskLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(TaskAddedListState(tasklst: event.task));
  }

  Future<FutureOr<void>> _addTaskEvent(
      AddTaskEvent event, Emitter<HomeState> emit) async {
    emit(TaskLoadingState());
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      TaskAddedListState(tasklst: event.tasks),
    );
  }
}
