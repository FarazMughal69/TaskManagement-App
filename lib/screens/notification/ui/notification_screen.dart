import 'package:flutter/material.dart';
import 'package:task_app/screens/notification/bloc/export_notification.dart';

import '../../../main.dart';
import '../../../widgets/custom_appbar.dart';

class NotificationScreen extends StatefulWidget {
  final NotificationBloc notificationBloc;
  const NotificationScreen({super.key, required this.notificationBloc});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _controller = ScrollController();
  bool whiteClr = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset < (190 - kToolbarHeight)) {
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
              pageTitle: 'Notifications',
            ),
          ),
          toolbarHeight: 50,
        ),
      ],
    );
  }
}
