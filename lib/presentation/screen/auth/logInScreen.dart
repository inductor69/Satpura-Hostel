// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/core/constant/textController.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late AuthService authService;
  bool showLoading = false;
  bool showAlert = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/login.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: const Text(
                      'Satpura Hostel',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Text(
                      'Welcome.',
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(0xff810e2e),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Color(0xff810e2e),// Set the border color to black
                            width: 1.0, // Set the border width
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Color(0xff810e2e),// Set the border color to black
                            width: 1.0, // Set the border width
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 15),
                            decoration: BoxDecoration(
                                color: const Color(0xff810e2e),
                                border: Border.all(
                                  color: const Color(0xff810e2e),
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          onTap: () async {
                            setState(() {
                              showLoading = true;
                            });

                            progressIndicater(context, showLoading = true);
                            await loginByRole();
                            await showAlert == true
                                ? null
                                : progressIndicater(
                                    context, showLoading = true);
                            emailController.clear();
                            passwordController.clear();
                            Navigator.pop(context);
                            //  Navigator.pushNamed(
                            //     context, adminDashbordScreenRoute);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            emailController.clear();
                            passwordController.clear();
                            Navigator.pushNamed(
                                context, registrationScreenRoute);
                          },
                          child: const Text(
                            'Not Registred yet?',
                            style: TextStyle(
                                color: Color(0xff810e2e),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic>? progressIndicater(BuildContext context, showLoading) {
    if (showLoading == true) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
    } else
      return null;
  }

  loginByRole() async {
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text.toString(), passwordController.text.toString());
      if (emailController.text.toString() == 'admin@iitd.ac.in') {
        Navigator.pushNamedAndRemoveUntil(
            context, adminDashbordScreenRoute, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, studentDashboardScreenRoute, (route) => false);
      }
    } catch (e) {
      return alertBox(context, e);
    }
  }

  Future<void> alertBox(BuildContext context, e) {
    setState(() {
      showLoading = false;
      showAlert = true;
    });
    return Alert(
      context: context,
      title: "ALERT",
      desc: e.toString(),
    ).show();
  }
}
