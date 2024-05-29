// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/data_model/tasks_data_models.dart';
import 'package:task_app/screens/login/login.dart';
import 'screens/rootscreen/cubit/navigation_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task App',
        home: LoginScreen(),
      ),
    );
  }
}

List<Tasks> allTasklst = [
  Tasks(
    dateTime: DateTime.now(),
    title: 'title',
    assignBy: 'assignBy',
    assignTo: 'assignTo',
    description:
        'descri ptiond escr ipti onde  scr iption desc ription descr ipti ondescri ptionde description',
  ),
];

// class MyDateTime {
//   DateTime now = DateTime.now();
//   late int todayweekDay;
//   MyDateTime();

//   void setWeekday() {
//     todayweekDay = now.day;
//   }
// }

// MyDateTime obj = MyDateTime();
// int todayWD = obj.todayweekDay;
