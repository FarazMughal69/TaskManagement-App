import 'package:flutter/material.dart';

class ProfilePicwidget extends StatelessWidget {
  const ProfilePicwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // color: const Color.fromARGB(255, 111, 205, 10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            'assets/images/faraz.jpg',
          ),
        ),
      ),
    );
  }
}
