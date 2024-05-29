import 'dart:ui';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'profile_picwidget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.pageTitle});
  final String pageTitle;
  final String profileName = "Faraz";

  @override
  Widget build(BuildContext context) {
    const double bordrRadius = 25.0;
    const String appBarimg = 'assets/images/Black-Backgrounds.jpg';
    return SizedBox(
      // height: mq.height * .28,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: mq.height * .28,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bordrRadius),
                  bottomRight: Radius.circular(bordrRadius),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage(
                    appBarimg,
                  ),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 0.90,
                  sigmaY: 0.90,
                ),
                child: Container(
                  height: mq.height * .24,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(bordrRadius),
                      bottomRight: Radius.circular(bordrRadius),
                    ),
                    color: const Color.fromARGB(157, 0, 0, 0).withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: mq.width * .05,
            top: mq.height * .115,
            child: Text(
              'Hey $profileName !',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            left: mq.width * .05,
            top: mq.height * .15,
            child: SizedBox(
              width: mq.width * 0.4,
              child: Text(
                pageTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: mq.height * .14,
            right: mq.width * .04,
            child: const ProfilePicwidget(),
          ),
        ],
      ),
    );
  }
}
