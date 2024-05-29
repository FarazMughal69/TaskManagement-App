import 'package:flutter/material.dart';
// import 'package:task_app/screens/home/bloc/home_bloc_exports.dart';

// import '../tasks/bloc/tasks_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  // final TasksBloc _tasksBloc = TasksBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.amber[200],
      ),
    );
    // return BlocConsumer<TasksBloc, TasksState>(
    //   bloc: _tasksBloc,
    //   listenWhen: (previous, current) => current is TaskActionState,
    //   buildWhen: (previous, current) => current is! TaskActionState,
    //   builder: ((context, state) {
    //     if (state.runtimeType == TasksInitialState) {
    //       final successState = state as TasksInitialState;
    //       return ListView.builder(
    //         itemCount: successState.tasks.length,
    //         itemBuilder: (context, index) {
    //           return Container(
    //             color: Colors.deepPurple,
    //             height: 200,
    //             width: 200,
    //             child: Center(child: Text(successState.tasks[index].title)),
    //           );
    //         },
    //         // color: Colors.deepPurple,
    //         // height: 200,
    //         // width: 200,
    //         // child: Center(child: Text(successState.tasks[])),
    //       );
    //     } else {
    //       return Container(
    //         color: Colors.deepPurple,
    //         height: 200,
    //         width: 200,
    //         child: const Center(
    //             child: Text("There is some issue please try again later")),
    //       );
    //     }
    //   }),
    //   listener: (context, state) {},
    // );
  }
}
