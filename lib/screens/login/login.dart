import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/constant/style_constant.dart';
import 'package:task_app/screens/rootscreen/ui/root_screen.dart';
import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusNode myUNFocusNode;
  late FocusNode myPWFocusNode;
  late bool rememberMe = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    myUNFocusNode = FocusNode();
    myPWFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    myUNFocusNode.dispose();
    myPWFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: SizedBox(
            width: mq.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100.0),
                  child: AnimatedContainer(
                    width: mq.width * 0.75,
                    height: mq.height * 0.22,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(150),
                          topLeft: Radius.circular(150)),
                      boxShadow: [
                        ConstantStyle.lowerBoxShadow,
                        // ConstantStyle.upperBoxShadow,
                        const BoxShadow(
                          color: Color.fromARGB(192, 43, 42, 42),
                          offset: Offset(4, 6),
                        ),
                        // BoxShadow(
                        //   color: Color.fromARGB(224, 21, 21, 21),
                        //   offset: Offset(-4, -8),
                        // ),
                      ],
                    ),
                    duration: const Duration(seconds: 5),
                    child: Center(
                      child: Text(
                        'T A S K - A P P',
                        style: GoogleFonts.eczar(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 246, 237, 237),
                            shadows: [
                              Shadow(
                                  offset: Offset(2, 4),
                                  color: Color.fromARGB(137, 104, 102, 102))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                MyTxtFormField(
                  myFocusNode: myUNFocusNode,
                  textEditingController: userName,
                  label: 'User Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordFormField(
                  myFocusNode: myPWFocusNode,
                  textEditingController: password,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: SizedBox(
                    width: mq.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: mq.width * 0.38,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    if (!rememberMe) {
                                      rememberMe = true;
                                    } else {
                                      rememberMe = false;
                                    }
                                  });
                                },
                              ),
                              Text(
                                'Remember me',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  decorationColor: CupertinoColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password?',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _formkey.currentState!.validate();
                    _auth
                        .signInWithEmailAndPassword(
                          email: userName.text,
                          password: password.text,
                        )
                        .then(
                          (value) => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootScreen(),
                              ),
                            ),
                          },
                        );
                  },
                  child: AnimatedContainer(
                    height: 50,
                    width: mq.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 3),
                          spreadRadius: 0.3,
                          blurRadius: 0.9,
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 800),
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 246, 237, 237),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mq.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          decorationColor: Colors.black54,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'Signup');
                        },
                        child: Text(
                          'SignUp',
                          style: GoogleFonts.montserrat(
                              fontSize: 13,
                              decorationColor: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: mq.width * 0.7,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Divider(
                            color: Color.fromARGB(132, 0, 0, 0),
                            thickness: 0.8,
                            endIndent: 5,
                          ),
                        ),
                      ),
                      Text(
                        'OR',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Divider(
                            color: Color.fromARGB(132, 0, 0, 0),
                            thickness: 0.8,
                            indent: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      // decoration: BoxDecoration(
                      //     color: const Color.fromARGB(255, 253, 253, 253),
                      //     borderRadius: BorderRadius.circular(50),
                      //     boxShadow: [ConstantStyle.lowerBoxShadow]),
                      child: Image.network(
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                        'https://banner2.cleanpng.com/20191001/gaq/transparent-circle-logo-font-symbol-icon-5d9e26514e1e31.81073030157064558532.jpg',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      // decoration: BoxDecoration(
                      //     color: const Color.fromARGB(255, 253, 253, 253),
                      //     borderRadius: BorderRadius.circular(50),
                      //     boxShadow: [ConstantStyle.lowerBoxShadow]),
                      child: Image.network(
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                        'https://banner2.cleanpng.com/20200525/les/transparent-huazhou-circle-font-analytic-trigonometry-and-coni-5ecbfaea12bb11.6162444215904263460767.jpg',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTxtFormField extends StatelessWidget {
  final FocusNode myFocusNode;
  final TextEditingController textEditingController;
  final String label;
  final String errorTxt;
  final String hintTxt;
  final bool obscureText;
  const MyTxtFormField({
    super.key,
    required this.myFocusNode,
    required this.textEditingController,
    required this.label,
    this.errorTxt = 'Error',
    this.hintTxt = 'Hint Text',
    this.obscureText = false,
  });

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
        onTapOutside: (event) => myFocusNode.unfocus(),
        focusNode: myFocusNode,
        controller: textEditingController,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorTxt;
          }
          return null;
        },
        decoration: InputDecoration(
          suffix: const Text('hide'),
          contentPadding: const EdgeInsets.only(top: 8, left: 9.0),
          constraints: BoxConstraints.loose(Size(mq.width * 0.7, 50)),
          label: Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 13,
            ),
          ),
          hintText: hintTxt,
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

class PasswordFormField extends StatelessWidget {
  final FocusNode myFocusNode;
  final TextEditingController textEditingController;
  const PasswordFormField(
      {super.key,
      required this.myFocusNode,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(255, 247, 243, 243),
          boxShadow: [
            ConstantStyle.lowerBoxShadow,
            // ConstantStyle.upperBooxShadow,
          ]),
      height: 50,
      child: TextFormField(
        onTapOutside: (event) => myFocusNode.unfocus(),
        focusNode: myFocusNode,
        controller: textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter a valid Password';
          } else if (value.length < 5) {
            return 'password length must be greater than 6';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 8, left: 9.0),
          constraints: BoxConstraints.loose(Size(mq.width * 0.7, 50)),
          label: Text(
            'Username',
            style: GoogleFonts.montserrat(
              fontSize: 13,
            ),
          ),
          hintText: 'Enter user name',
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
