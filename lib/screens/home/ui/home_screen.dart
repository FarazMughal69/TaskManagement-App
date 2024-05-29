// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:task_app/screens/home/bloc/home_bloc_exports.dart';
import '../../rootscreen/cubit/navigation_cubit.dart';
import '../../../main.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/project_widget.dart';
import '../../../widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  final HomeBloc homeBloc;

  const HomeScreen({
    Key? key,
    required this.homeBloc,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController homeScrollcontroller = ScrollController();
  bool whiteClr = true;
  @override
  void initState() {
    homeScrollcontroller.addListener(_scrollListener);
    widget.homeBloc.add(HomeIntialEvent(task: allTasklst));
    super.initState();
  }

  void _scrollListener() {
    if (homeScrollcontroller.offset < (190 - kToolbarHeight)) {
      setState(() {
        whiteClr = true;
      });
    } else {
      setState(() {
        whiteClr = false;
      });
    }
  }

  @override
  void dispose() {
    homeScrollcontroller.dispose();
    // widget.homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: homeScrollcontroller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: whiteClr ? Colors.transparent : Colors.grey[100],
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: whiteClr ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_rounded,
                color: whiteClr ? Colors.white : Colors.black,
              ),
            ),
          ],
          // elevation: 2.0,
          title: Text(
            'T A S K A P P',
            style: TextStyle(
              color: whiteClr ? Colors.white : Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          expandedHeight: mq.height * .24,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            // centerTitle: true,
            background: CustomAppBar(
              pageTitle: "Let's Find your Best Project! ",
            ),
          ),
          toolbarHeight: 50,
        ),
        // SliverPadding(padding: EdgeInsets.only(top: mq.height * 0.01)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, left: 20, right: 20, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationCubit>(context)
                        .navgateToProjectListScreen();
                  },
                  child: Text(
                    'view all',
                    style: TextStyle(
                      color: Color.fromARGB(255, 133, 35, 142),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverAppBar(
          expandedHeight: mq.height * 0.34,
          flexibleSpace: FlexibleSpaceBar(
            // collapseMode: CollapseMode.pin,
            background: Project(
              width: 20.0,
              title: '',
              description: '',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 20),
                child: Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, right: 20),
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<NavigationCubit>(context)
                        .navgateToTaskListScreen();
                  },
                  child: Text(
                    'view all',
                    style: TextStyle(
                      color: Color.fromARGB(255, 133, 35, 142),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: BlocConsumer<HomeBloc, HomeState>(
            bloc: widget.homeBloc,
            listenWhen: ((previous, current) => current is HomeActionState),
            buildWhen: ((previous, current) => current is! HomeActionState),
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case TaskLoadingState:
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );

                case TaskAddedListState:
                  final successState = state as TaskAddedListState;
                  return SliverList.builder(
                    itemCount: successState.tasklst.length,
                    itemBuilder: (context, index) {
                      return TaskListWidget(
                        taskList: successState.tasklst,
                        index: index,
                      );
                    },
                  );
                default:
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text('There Some Issue'),
                    ),
                  );
              }
            },
          ),
        )
      ],
    );
  }
}
