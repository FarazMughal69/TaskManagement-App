import 'package:flutter/material.dart';

import '../data_model/tasks_data_models.dart';
import '../main.dart';
import 'task_custompainter.dart';

class ExpandedTaskListWidget extends StatefulWidget {
  const ExpandedTaskListWidget(
      {super.key,
      required this.allTasklst,
      required this.index,
      this.onChanged,
      required this.isSelected});
  final List<Tasks> allTasklst;
  final int index;
  final ValueChanged<bool>? onChanged;
  final bool isSelected;

  @override
  State<ExpandedTaskListWidget> createState() => _ExpandedTaskListWidgetState();
}

class _ExpandedTaskListWidgetState extends State<ExpandedTaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: mq.height * 0.2,
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
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
        child: CustomPaint(
          foregroundPainter: MyPainter(isSelected: widget.isSelected),
          child: Column(children: [
            // Text(widget.allTasklst[widget.index].dateTime.toString())
            Text(widget.allTasklst[widget.index].title)
          ]),
        ),
      ),
    );
  }
}
