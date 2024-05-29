import 'package:flutter/material.dart';
import 'package:task_app/screens/notification/bloc/export_notification.dart';
import 'package:task_app/screens/notification/ui/notification_screen.dart';
import 'package:task_app/screens/profile/ui/profile_screen.dart';
import 'package:task_app/screens/projects/ui/project_screen.dart';
import 'package:task_app/screens/tasks/bloc/tasks_bloc.dart';
import 'package:task_app/screens/tasks/ui/task_screen.dart';

import '../../../constant/nav_items.dart';
import '../cubit/navigation_cubit.dart';
import '../../../main.dart';
import '../../../widgets/add_screen.dart';
import '../../home/bloc/home_bloc_exports.dart';
import '../../home/ui/home_screen.dart';

class RootScreen extends StatelessWidget {
  RootScreen({
    super.key,
  });
  final TasksBloc tasksBloc = TasksBloc();
  final NotificationBloc notificationBloc = NotificationBloc();
  final HomeBloc homeBloc = HomeBloc();

  void _addTaskScreen(
      BuildContext context, TextEditingController editingController) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            width: mq.width * 0.9,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
            ),
            child: AddTaskWidget(
              addTaskTxtController: editingController,
              homeBloc: homeBloc,
              // onChanged: _onSaveNewTask,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();

    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomAppBar(
            padding: const EdgeInsets.only(right: 10, left: 10),
            color: Colors.grey[100],
            height: mq.height / 20,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(right: mq.width * 0.19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        // padding: state.navbarItem == NavbarItem.home
                        //     ? const EdgeInsets.only(bottom: 3.0)
                        //     : null,
                        onTap: () {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavbarItems(
                            NavbarItem.home,
                          );
                        },
                        child: Icon(
                          Icons.home_filled,
                          size: 25,
                          color: state.navbarItem == NavbarItem.home
                              ? Colors.black87
                              : Colors.grey[600],
                        ),
                      ),
                      state.navbarItem == NavbarItem.home
                          ? const Dotwidget()
                          : const SizedBox(),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavbarItems(
                            NavbarItem.tasklist,
                          );
                        },
                        child: Icon(
                          Icons.view_list_outlined,
                          size: 25,
                          color: state.navbarItem == NavbarItem.tasklist
                              ? Colors.black87
                              : Colors.grey[600],
                        ),
                      ),
                      state.navbarItem == NavbarItem.tasklist
                          ? const Dotwidget()
                          : const SizedBox(),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavbarItems(
                            NavbarItem.notification,
                          );
                        },
                        child: Icon(
                          Icons.notifications,
                          size: 25,
                          color: state.navbarItem == NavbarItem.notification
                              ? Colors.black87
                              : Colors.grey[600],
                        ),
                      ),
                      state.navbarItem == NavbarItem.notification
                          ? const Dotwidget()
                          : const SizedBox(),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavbarItems(
                            NavbarItem.profile,
                          );
                        },
                        child: Icon(
                          color: state.navbarItem == NavbarItem.profile
                              ? Colors.black87
                              : Colors.grey[600],
                          Icons.person,
                          size: 25,
                        ),
                      ),
                      state.navbarItem == NavbarItem.profile
                          ? const Dotwidget()
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return HomeScreen(
              homeBloc: homeBloc,
            );
          } else if (state.navbarItem == NavbarItem.tasklist) {
            return const TaskScreen();
          } else if (state.navbarItem == NavbarItem.notification) {
            return NotificationScreen(notificationBloc: notificationBloc);
          } else if (state.navbarItem == NavbarItem.profile) {
            return const ProfileScreen();
          } else if (state.navbarItem == NavbarItem.project) {
            return const ProjectScreen();
          }
          return const Center(
            child: Text('Some thing is wrong try again later.'),
          );
          //return const HomeScreen();
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        elevation: 3.0,
        mini: true,
        backgroundColor: Colors.black87,
        onPressed: () {
          _addTaskScreen(context, editingController);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
        ),
        child: Icon(
          Icons.add_task_rounded,
          color: Colors.grey[100],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Dotwidget extends StatelessWidget {
  const Dotwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 3,
      height: 3,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black87,
      ),
    );
  }
}
