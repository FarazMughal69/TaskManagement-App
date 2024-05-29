import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/data_model/tasks_data_models.dart';
import 'package:task_app/main.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitialState(tasks: allTasklst)) {
    on<OnTaskInitialEvent>(onTaskInitialEvent);
    on<OnTaskSavedEvent>(onTaskSavedEvent);
  }

  FutureOr<void> onTaskInitialEvent(
      OnTaskInitialEvent event, Emitter<TasksState> emit) {
    var tasks = event.lst;
    emit(TasksInitialState(tasks: tasks));
    // print(tasks);
  }

  FutureOr<void> onTaskSavedEvent(
      OnTaskSavedEvent event, Emitter<TasksState> emit) {
    var tasks = event.lst;
    emit(OnTaskSavedState(tasks: tasks));
    // print(tasks.length);
  }
}
