// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Weekday { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december
}

class DateAndTime {
  late DateTime now = DateTime.now();
  late int month = now.month;
  late int todayWD = DateTime.now().weekday;
  late int day = now.day;
  late int year = now.year;
  late var hour = now.hour;
  ({List<int> days, List<String> weekdays}) monthWeekDaysAndDays =
      (days: [], weekdays: []);
  ({List<int> days, List<String> weekdays}) lastThreeDays =
      (days: [], weekdays: []);
  ({List<int> days, List<String> weekdays}) firstThreeDays =
      (days: [], weekdays: []);

  String weekdayToString(Weekday weekday) {
    switch (weekday) {
      case Weekday.monday:
        return 'Mon';
      case Weekday.tuesday:
        return 'Tue';
      case Weekday.wednesday:
        return 'Wed';
      case Weekday.thursday:
        return 'Thu';
      case Weekday.friday:
        return 'Fri';
      case Weekday.saturday:
        return 'Sat';
      case Weekday.sunday:
        return 'Sun';
    }
  }

  String monthToString(Month month) {
    switch (month) {
      case Month.january:
        return 'January';
      case Month.february:
        return 'February';
      case Month.march:
        return 'March';
      case Month.april:
        return 'April';
      case Month.may:
        return 'May';
      case Month.june:
        return 'June';
      case Month.july:
        return 'July';
      case Month.august:
        return 'August';
      case Month.september:
        return 'September';
      case Month.october:
        return 'October';
      case Month.november:
        return 'November';
      case Month.december:
        return 'December';
    }
  }

  ({List<int> days, List<String> weekdays}) getThreeDaysofLastMonth() {
    // DateTime now = DateTime.now();
    DateTime lastdayOfMonth = DateTime(now.year, now.month, 0);
    for (int i = 0; i < 3; i++) {
      DateTime dt = lastdayOfMonth.subtract(Duration(days: i));
      lastThreeDays.days.add(dt.day);
      lastThreeDays.weekdays
          .add(weekdayToString(Weekday.values[dt.weekday - 1]));
    }

    return (days: lastThreeDays.days, weekdays: lastThreeDays.weekdays);
  }

  ({List<int> days, List<String> weekdays}) getThreeDaysofnextMonth() {
    // DateTime now = DateTime.now();
    DateTime firstdayOfnextMonth = DateTime(now.year, now.month + 1, 1);
    if (firstdayOfnextMonth.month > 12) {
      firstdayOfnextMonth = DateTime(now.year + 1, 1, 1);
    }
    for (int i = 0; i < 3; i++) {
      DateTime dt = firstdayOfnextMonth.add(Duration(days: i));
      firstThreeDays.days.add(dt.day);
      firstThreeDays.weekdays
          .add(weekdayToString(Weekday.values[dt.weekday - 1]));
    }

    return (days: firstThreeDays.days, weekdays: firstThreeDays.weekdays);
  }

  ({List<int> days, List<String> weekdays}) getAllWeekAndDaysOfCurrentMonth() {
    // Set the date to the first day of the current month
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);

    // Set the date to the last day of the current month
    // Get the last day of the month by setting day to 0 of the next month
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // List to store the days of the current month

    // Loop through each day from the first day to the last day of the month
    for (DateTime date = firstDayOfMonth;
        date.isBefore(
      lastDayOfMonth.add(
        const Duration(days: 1),
      ),
    );
        date = date.add(
      const Duration(days: 1),
    ),) {
      // Add the day of the month to the list
      monthWeekDaysAndDays.weekdays
          .add(weekdayToString(Weekday.values[date.weekday - 1]));
      monthWeekDaysAndDays.days.add(date.day);
    }

    // Return the list of days
    return (
      days: monthWeekDaysAndDays.days,
      weekdays: monthWeekDaysAndDays.weekdays
    );
  }

  ({List<int> days, List<String> weekdays}) combinedList() {
    ({List<int> days, List<String> weekdays}) lst = getThreeDaysofLastMonth();
    ({List<int> days, List<String> weekdays}) lst1 =
        getAllWeekAndDaysOfCurrentMonth();
    ({List<int> days, List<String> weekdays}) lst3 = getThreeDaysofnextMonth();

    return (
      days: [...lst.days.reversed, ...lst1.days, ...lst3.days],
      weekdays: [...lst.weekdays.reversed, ...lst1.weekdays, ...lst3.weekdays]
    );
  }

  int getIndexOfCurrentDate() {
    ({List<int> days, List<String> weekdays}) lst = combinedList();
    // print(day);
    return lst.days.indexOf(day);
  }
}
