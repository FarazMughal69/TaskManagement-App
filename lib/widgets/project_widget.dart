import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../main.dart';

// import '../../main.dart';

class Project extends StatefulWidget {
  final double width;
  final Color backdropFilterClr;
  final String title;
  final String description;
  // final ExactAssetImage background;

  const Project({
    super.key,
    required this.width,
    this.backdropFilterClr = Colors.transparent,
    required this.title,
    required this.description,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int _selectedIndex = -1;
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return VisibilityDetector(
          key: Key(index.toString()),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction == 1) {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: mq.width * 0.6,
                  height: _selectedIndex == index
                      ? mq.height * 0.31
                      : mq.height * 0.27,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  // margin: const EdgeInsets.symmetric(vertical: 5.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      _selectedIndex == index
                          ? const BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6,
                              offset: Offset(6, 7), // Shadow position
                            )
                          : const BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 0,
                            )
                    ],
                    color: _selectedIndex == index
                        ? Colors.black87.withOpacity(0.9)
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Text(
                          "Task App",
                          style: TextStyle(
                              color: _selectedIndex == index
                                  ? Colors.grey[100]
                                  : Colors.black87,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Positioned(
                        top: mq.height * 0.059,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                            style: TextStyle(
                              color: _selectedIndex == index
                                  ? Colors.grey[100]
                                  : Colors.black87,
                              // fontSize: 16,
                              // fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: _selectedIndex == index
                            ? mq.height * 0.23
                            : mq.height * 0.2,
                        left: mq.width * 0.43,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_circle_right,
                            color: _selectedIndex == index
                                ? Colors.grey[100]
                                : Colors.black87,
                            size: _selectedIndex == index ? 32 : 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
