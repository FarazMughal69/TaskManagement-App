// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:task_app/data_model/tasks_data_models.dart';
import 'package:task_app/screens/home/bloc/home_bloc_exports.dart';
// import 'package:task_app/screens/home/bloc/home_bloc_exports.dart';
// import 'package:task_app/screens/tasks/bloc/tasks_bloc.dart';

import '../main.dart';

class AddTaskWidget extends StatefulWidget {
  final TextEditingController addTaskTxtController;
  final ValueChanged<bool>? onChanged;
  final HomeBloc homeBloc;
  const AddTaskWidget({
    Key? key,
    required this.addTaskTxtController,
    this.onChanged,
    required this.homeBloc,
  }) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _titleKey = GlobalKey<FormFieldState>();
  final _descriptionKey = GlobalKey<FormFieldState>();
  final TextEditingController _titleTxtController = TextEditingController();
  final TextEditingController _descriptionTxtController =
      TextEditingController();
  DateTime datetime = DateTime.now();
  String dateTimeTxt = 'Add Date An Time';
  // final bool _isSavebtnClicked = false;
  // late Tasks task;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    _selectTime(pickedDate!);
  }

  Future<void> _selectTime(DateTime pickedDate) async {
    if (true) {
      final TimeOfDay? pickedTime = await showTimePicker(
        initialTime: const TimeOfDay(hour: 12, minute: 0),
        context: context,
      );
      if (pickedTime != null) {
        datetime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          dateTimeTxt = datetime.toString();
        });
      }
    }
  }

  void _onSaveButtonClicked() {
    String title = _titleKey.currentState!.value.toString();
    String description = _descriptionKey.currentState!.value.toString();
    Tasks task = Tasks(
        dateTime: datetime,
        title: title,
        description: description,
        assignBy: 'Iqbal',
        assignTo: 'Faraz');
    allTasklst.add(task);
    widget.homeBloc.add(AddTaskEvent(tasks: allTasklst));
    _titleTxtController.clear();
    _descriptionTxtController.clear();
  }

  @override
  void initState() {
    super.initState();
    // widget.tasksBloc.add(OnTaskInitialEvent(lst: allTasklst));
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (field) {
        return SizedBox(
          width: mq.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 20.0,
                      top: 10.0,
                      left: 20,
                    ),
                    child: Text(
                      'Add Task',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        shadows: [
                          BoxShadow(
                            color: Color.fromARGB(128, 158, 158, 158),
                            blurRadius: 8,
                            offset: Offset(4, 4),
                          ),
                          BoxShadow(
                            color: Color.fromARGB(174, 236, 236, 234),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(-1, -2),
                          ),
                        ],
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(128, 158, 158, 158),
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Color.fromARGB(174, 236, 236, 234),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(-1, -2),
                      ),
                    ],
                  ),
                  height: 50,
                  width: mq.width * 0.7,
                  child: TextFormField(
                    key: _titleKey,
                    controller: _titleTxtController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(128, 158, 158, 158),
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Color.fromARGB(174, 236, 236, 234),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(-1, -2),
                      ),
                    ],
                  ),
                  height: 50,
                  width: mq.width * 0.7,
                  child: TextFormField(
                    key: _descriptionKey,
                    controller: _descriptionTxtController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: mq.width * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(128, 158, 158, 158),
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Color.fromARGB(174, 236, 236, 234),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(-1, -2),
                      ),
                    ],
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.date_range_outlined),
                    label: Text(dateTimeTxt),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: mq.width * 0.7,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        // splashColor: Colors.black87,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: mq.width * 0.3,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(128, 158, 158, 158),
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Color.fromARGB(174, 236, 236, 234),
                                spreadRadius: 0,
                                blurRadius: 6,
                                offset: Offset(-1, -2),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Close',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _onSaveButtonClicked();
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: mq.width * 0.3,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(128, 158, 158, 158),
                                blurRadius: 4,
                                offset: Offset(6, 6),
                              ),
                              BoxShadow(
                                color: Color.fromARGB(174, 236, 236, 234),
                                spreadRadius: 0,
                                blurRadius: 6,
                                offset: Offset(-1, -2),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
