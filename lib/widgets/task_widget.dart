import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data_model/tasks_data_models.dart';
import '../main.dart';
import 'customdropdown.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget(
      {super.key, required this.taskList, required this.index});

  final List<Tasks> taskList;
  final int index;

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  final TextEditingController taskStatusController = TextEditingController();
  late Tasks task = widget.taskList[widget.index];
  late String firstHalf;
  late String description;

  @override
  void initState() {
    description = task.description;
    if (description.length > 40) {
      firstHalf = description.substring(0, 40);
      firstHalf = '$firstHalf....';
    } else {
      firstHalf = description;
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var task = allTasklst[index];
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 15),
      constraints: BoxConstraints.loose(Size(mq.width * 0.8, mq.height * 0.09)),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(128, 158, 158, 158),
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
          BoxShadow(
            color: Color.fromARGB(
                174, 236, 236, 234), // Color and opacity of the shadow
            spreadRadius: 0,
            blurRadius: 6, // Spread and blur radius of the shadow
            offset: Offset(-1, -2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Checkbox(
              // side: BorderSide.none,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 122, 118, 118);
                }
                if (states.contains(MaterialState.selected)) {
                  return const Color.fromARGB(255, 0, 0, 0);
                }
                return Colors.transparent;
              }),
              value: (widget.taskList[widget.index].isDone),
              onChanged: (value) {
                setState(() {
                  if (widget.taskList[widget.index].isDone!) {
                    widget.taskList[widget.index].isDone = false;
                  } else {
                    widget.taskList[widget.index].isDone = true;
                  }
                });
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: mq.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.taskList[widget.index].title,
                      style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    // Text(
                    //   'Status:',
                    //   style: GoogleFonts.montserrat(
                    //       color: Colors.black87,
                    //       fontSize: 10.0,
                    //       fontWeight: FontWeight.w500),
                    // ),
                    // const CustomDropDown(),
                    CustomDropdown(
                      onChange: (int value, int index) {
                        task.taskStatus = value.toString();
                      },
                      dropdownButtonStyle: DropdownButtonStyle(
                        width: 100,
                        height: 30,
                        elevation: 1,
                        backgroundColor: Colors.grey[200],
                        primaryColor: Colors.black87,
                      ),
                      dropdownStyle: DropdownStyle(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 6,
                          padding: const EdgeInsets.all(5),
                          color: Colors.grey[200]),
                      items: [
                        'Todo',
                        'In Progress',
                        'In review',
                        'Done',
                        'Deffered',
                      ]
                          .asMap()
                          .entries
                          .map(
                            (item) => DropdownItem<int>(
                              value: item.key + 1,
                              child: Text(item.value),
                            ),
                          )
                          .toList(),
                      child: Text(task.taskStatus!),
                    )
                    // GestureDetector(
                    //   child: AnimatedContainer(
                    //     padding: const EdgeInsets.only(left: 8.0),
                    //     decoration: BoxDecoration(color: Colors.grey[200]),
                    //     duration: const Duration(seconds: 1),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         DropdownMenu<TaskStatus>(
                    //             inputDecorationTheme:
                    //                 const InputDecorationTheme(
                    //               contentPadding: EdgeInsets.all(0.0),
                    //               border: InputBorder.none,
                    //             ),
                    //             // width: 50, //mq.width * 0.4,
                    //             initialSelection: TaskStatus.todo,
                    //             controller: taskStatusController,
                    //             dropdownMenuEntries: TaskStatus.values
                    //                 .map<DropdownMenuEntry<TaskStatus>>(
                    //                     (TaskStatus taskStatus) {
                    //               return DropdownMenuEntry<TaskStatus>(
                    //                   label: taskStatus.label,
                    //                   value: taskStatus,
                    //                   style: ButtonStyle(
                    //                       fixedSize: MaterialStateProperty.all(
                    //                           Size(30, 50))));
                    //             }).toList()),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                width: mq.width * 0.7,
                child: Text(
                  firstHalf,
                  style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(159, 0, 0, 0),
                    fontSize: 13.0,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum TaskStatus {
  todo('Todo', 1),
  inprogress(
    'In Progress',
    2,
  ),
  inreview('In Review', 3),
  deffered('Deffered', 4),
  done('Done', 5);

  const TaskStatus(this.label, this.id);
  final String label;
  final int id;
}
