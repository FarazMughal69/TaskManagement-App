import 'package:flutter/material.dart';

import '../constant/date_time_const.dart';
import '../main.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  final ScrollController _taskcontroller = ScrollController();
  // String weekday =
  //     DateAndTime().weekdayToString(Weekday.values[DateAndTime().todayWD - 1]);
  ({List<int> days, List<String> weekdays}) monthRecord =
      DateAndTime().combinedList();
  int indexOfCurrentDate = DateAndTime().getIndexOfCurrentDate();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _taskcontroller.animateTo(
            _taskcontroller.offset + (57.6 * (indexOfCurrentDate - 3)),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _taskcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _taskcontroller,
      scrollDirection: Axis.horizontal,
      itemCount: monthRecord.days.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.02,
              vertical: index == indexOfCurrentDate ? 10.0 : 15),
          child: Container(
            width: mq.width * 0.1,
            height: 60,
            // padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color:
                  index == indexOfCurrentDate ? Colors.black87 : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              boxShadow: const [
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  // widthFactor: 2.0,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      monthRecord.days[index].toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ),
                  ),
                ),
                Align(
                  // widthFactor: 3.0,
                  alignment: Alignment.center,
                  child: Text(
                    monthRecord.weekdays[index],
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
