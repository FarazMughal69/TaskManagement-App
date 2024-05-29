import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constant/nav_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void navgateToTaskListScreen() {
    emit(const NavigationState(NavbarItem.tasklist, 2));
  }

  void navgateToProjectListScreen() {
    emit(const NavigationState(NavbarItem.project, 4));
  }

  void getNavbarItems(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(
          const NavigationState(NavbarItem.home, 0),
        );
      case NavbarItem.tasklist:
        emit(
          const NavigationState(NavbarItem.tasklist, 1),
        );
      case NavbarItem.notification:
        emit(
          const NavigationState(NavbarItem.notification, 2),
        );
      case NavbarItem.profile:
        emit(
          const NavigationState(NavbarItem.profile, 3),
        );
      case NavbarItem.project:
        emit(
          const NavigationState(NavbarItem.project, 4),
        );

      default:
    }
  }
}
