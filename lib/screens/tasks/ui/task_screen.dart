// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:task_app/constant/date_time_const.dart';

import '../../../main.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/date_weekday_widget.dart';
import '../../../widgets/expanded_tasklist_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TasKScreenState();
}

class _TasKScreenState extends State<TaskScreen> {
  final ScrollController _taskcontroller = ScrollController();
  bool whiteClr = true;
  String month =
      DateAndTime().monthToString(Month.values[DateAndTime().month - 1]);
  String year = DateAndTime().year.toString();
  String day = DateAndTime().day.toString();

  // List<Tasks> allTasklst = [
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Original Title',
  //       assignBy: 'Malik Iqbal',
  //       assignTo: 'Faraz',
  //       description: 'Create Dashboard'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 2)),
  //       title: 'Original Title',
  //       assignBy: 'Malik Iqbal',
  //       assignTo: 'Faraz',
  //       description: 'Create Dashboard'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 3)),
  //       title: 'Original Title',
  //       assignBy: 'Malik Iqbal',
  //       assignTo: 'Faraz',
  //       description: 'Create Dashboard'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 4)),
  //       title: 'First Title',
  //       assignBy: 'Faraz',
  //       assignTo: 'Abid',
  //       description:
  //           'Attend the meeting Attend the meeting Attend the meeting Attend the meeting'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  //   Tasks(
  //       dateTime: DateTime.now().add(const Duration(hours: 1)),
  //       title: 'Second Title',
  //       assignBy: 'Arslan',
  //       assignTo: 'Sohail',
  //       description: 'Send the email to the Client'),
  // ];

  @override
  void initState() {
    super.initState();
    _taskcontroller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _taskcontroller.removeListener(_scrollListener);
    _taskcontroller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_taskcontroller.offset < (190 - kToolbarHeight)) {
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
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _taskcontroller,
      slivers: [
        SliverAppBar(
          backgroundColor: whiteClr ? Colors.transparent : Colors.grey[100],
          // centerTitle: true,
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
          elevation: 2.0,
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
          flexibleSpace: const FlexibleSpaceBar(
            centerTitle: true,
            background: CustomAppBar(
              pageTitle: 'Tasks',
            ),
          ),
          toolbarHeight: 50,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, left: 20, right: 20, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                    children: [
                      TextSpan(
                        text: month,
                      ),
                      TextSpan(
                        text: ' $day',
                      ),
                      TextSpan(
                        text: ', $year',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverAppBar(
          toolbarHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            background: DateWidget(),
          ),
        ),
        SliverList.builder(
          itemCount: allTasklst.length,
          itemBuilder: (context, index) {
            return ExpandedTaskListWidget(
              allTasklst: allTasklst,
              index: index,
              isSelected: true,
            );
          },
        ),
      ],
    );
  }
}
