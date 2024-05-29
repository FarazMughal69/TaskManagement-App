import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,

      // width: 400,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 211, 210, 207),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(CupertinoIcons.search),
          ),
          SizedBox(
            width: mq.width * 0.5,
            // height: 30,
            child: const TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(CupertinoIcons.slider_horizontal_3),
          )
        ],
      ),
    );
  }
}
