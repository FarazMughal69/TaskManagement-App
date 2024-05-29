import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/style_constant.dart';
import '../main.dart';

class MyTxtFormField extends StatefulWidget {
  final FocusNode myFocusNode;
  final TextEditingController textEditingController;
  final String label;
  final String errorTxt;
  final String hintTxt;
  final bool obscureText;
  final bool suffix;
  const MyTxtFormField({
    super.key,
    required this.myFocusNode,
    required this.textEditingController,
    required this.label,
    this.errorTxt = 'Error',
    this.hintTxt = 'Hint Text',
    this.obscureText = false,
    this.suffix = false,
  });

  @override
  State<MyTxtFormField> createState() => _MyTxtFormFieldState();
}

class _MyTxtFormFieldState extends State<MyTxtFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(255, 247, 243, 243),
          boxShadow: [
            ConstantStyle.lowerBoxShadow,
          ]),
      height: 50,
      child: TextFormField(
        onTapOutside: (event) => widget.myFocusNode.unfocus(),
        focusNode: widget.myFocusNode,
        controller: widget.textEditingController,
        obscureText: widget.obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorTxt;
          }
          return null;
        },
        decoration: InputDecoration(
          suffix: (widget.suffix
              ? Text(
                  'hide',
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                  ),
                )
              : null),
          contentPadding: const EdgeInsets.only(top: 8, left: 9.0),
          constraints: BoxConstraints.loose(Size(mq.width * 0.7, 50)),
          label: Text(
            widget.label,
            style: GoogleFonts.montserrat(
              fontSize: 13,
            ),
          ),
          hintText: widget.hintTxt,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 13,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 231, 231, 231)),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(193, 255, 255, 255),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
