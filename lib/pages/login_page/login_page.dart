
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_solutions_challenge/pages/homepage/homepage.dart';

import '../../config/configurations/loading_overlay.dart';
import '../../utils/exit_message.dart';
import '../pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUserWithEmailAndPassword(BuildContext context) async {
    showLoadingOverlay(
      context: context,
      asyncTask: () async {
        try {
          UserCredential userCredential =
              await _auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim(),
          );
        } catch (error) {
          print("Login error: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed to login. Please check your credentials."),
            ),
          );
        }
      },
      onCompleted: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ExperimentPage(),
          ),
          (route) => false,
        );
      },
    );
  }

  bool isUserLogged = false;

//password showing boolean
  bool isObscure = true;

//form variables
  final _formKey = GlobalKey<FormState>();

//controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

//function to validate form
// void validate(BuildContext context) {
//   var user;
//   if (_formKey.currentState!.validate()) {
//     showLoadingOverlay(
//       context: context,
//       asyncTask: () async {
//         try {
//           user = await UserController.login(
//               email: emailController.text.toString(),
//               password: passController.text.toString());
//           isUserLogged = true;
//         } catch (error) {
//           // Failed login
//           toastMessage(error.toString(), context);
//         }
//       },
//       onCompleted: () {
//         if (isUserLogged) {
//           if (user != null) {
//             if (UserController.currentUser!.isSeller) {
//               Navigator.pushNamedAndRemoveUntil(
//                   context, AdminMainPage.routeName, (route) => false);
//             } else {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 MainPage.routeName,
//                     (route) => false,
//               );
//             }
//           }
//         }
//       },
//     );
//   } else {
//     toastMessage("Please enter proper credentials", context);
//   }
// }

//function to show or hide password
  void showPass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //screen size
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    //constants
    double padding = 16.0;
    double lFontSize = 40.0;
    double gap = 30;
    double sFontSize = 16;
    Color fontColor = const Color.fromRGBO(151, 150, 161, 1);
    Color fontColor2 = const Color.fromRGBO(91, 91, 94, 1);
    double sGap = 10;
    double fieldHeight = height * 0.1;
    double lGap = 70.0;
    double buttonHeight = 60;
    double buttonWidth = 248;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await showExitWarning(context);
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Builder(builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: lGap * 1.4,
                            ),
                            SizedBox(
                              width: width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: lFontSize,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'SofiaPro'),
                                  ),
                                  SizedBox(
                                    height: gap,
                                  ),
                                  Image.asset(
                                      'assets/images/5500659_Artboard 1 1.png'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "E-mail",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sFontSize,
                                    fontFamily: 'SofiaPro'),
                              ),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding, right: padding),
                              child: SizedBox(
                                  height: fieldHeight,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        hintText: "Your email or phone",
                                        hintStyle: TextStyle(color: fontColor)),
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "email or phone number cannot be empty";
                                      }
                                      return null;
                                    },
                                  )),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sFontSize,
                                    fontFamily: 'SofiaPro'),
                              ),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding, right: padding),
                              child: SizedBox(
                                  height: fieldHeight,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () => showPass(),
                                            icon: isObscure
                                                ? const Icon(
                                                    Icons.visibility,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.white,
                                                  )),
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: fontColor)),
                                    controller: passController,
                                    validator: (value) {
                                      // if (value!.isEmpty) {
                                      //   return "password cannot be empty";
                                      // }
                                      return null;
                                    },
                                    obscureText: isObscure ? true : false,
                                  )),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.blue),
                            ),
                            onPressed: () {
                              loginUserWithEmailAndPassword(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            }, //validate(context),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sGap,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SofiaPro'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SIgnUpPage(),
                                      ));
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.blue, fontFamily: 'SofiaPro'),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: sGap,
                        ),
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       color: lineColor,
                        //       height: lineHeight,
                        //       width: lineWidth,
                        //     ),
                        //     Text(
                        //       "Sign in with",
                        //       style: TextStyle(
                        //           color: fontColor2,
                        //           fontWeight: FontWeight.w500,
                        //           fontFamily: 'SofiaPro'),
                        //     ),
                        //     Container(
                        //       color: lineColor,
                        //       height: lineHeight,
                        //       width: lineWidth,
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: sGap,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
