import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/core/constant/textController.dart';
import 'package:hostelapplication/logic/modules/user_model.dart';
import 'package:hostelapplication/logic/provider/userData_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late AuthService authService;
  bool showLoading = false;
  bool showAlert = false;

  //for storing form state.
  final _form = GlobalKey<FormState>();

  //saving form after validation
  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
  }

  String _emailError = ''; // Add this variable to store error message

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    final userDataProvider = Provider.of<UsereDataProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      body: SafeArea(
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.black,
                        height: 120,
                        width: 10,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Satpura',
                              style: GoogleFonts.poppins(
                                // Use GoogleFonts widget
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 45,
                              ),
                            ),
                            TextSpan(
                              text: '\nHostel',
                              style: GoogleFonts.poppins(
                                // Use GoogleFonts widget
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 40,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ],
                  ),
                  const Text(
                    'Welcome.',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff810e2e),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (((value) =>
                        userDataProvider.changeFirstName(value))),
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Enter First Name ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: Color(0xff810e2e),
                      ),
                      hintText: 'First Name',
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff810e2e)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: const BorderSide(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (((value) =>
                        userDataProvider.changeLastName(value))),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Enter Last Name ";
                      }
                      return null;
                    },
                    controller: lastNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: Color(0xff810e2e),
                      ),
                      hintText: 'Last Name',
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff810e2e)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (((value) =>
                        userDataProvider.changeMobileNo(value))),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Enter Mobile number ";
                      }
                      return null;
                    },
                    controller: mobileNoController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xff810e2e),
                      ),
                      hintText: 'Mobile No.',
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff810e2e)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (((value) =>
                        userDataProvider.changeEntryNo(value))),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Entry Number";
                      }
                      return null;
                    },
                    controller: entryNoController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.school,
                        color: Color(0xff810e2e),
                      ),
                      hintText: 'Entry No.',
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff810e2e)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (((value) =>
                        userDataProvider.changeRoomNo(value))),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Enter Valid Room No";
                      }
                      return null;
                    },
                    controller: roomNoController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.home_outlined,
                        color: Color(0xff810e2e),
                      ),
                      hintText: 'Room No',
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff810e2e)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      if (value.endsWith("@iitd.ac.in")) {
                        userDataProvider.changeEmail(value);
                        setState(() {
                          _emailError = ''; // Reset error message
                        });
                      } else {
                        setState(() {
                          _emailError =
                              'Please enter a valid email ending with @iitd.ac.in'; // Set error message
                        });
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff810e2e),
                      ),
                      hintText: 'Email',
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff810e2e)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      errorText: _emailError.isNotEmpty ? _emailError : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Color(0xff810e2e),
                      ),
                      hintText: 'Password',
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff810e2e)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xff810e2e),
                          width: 1,
                        ),
                      ),
                    ),
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
                                color: Color(0xff810e2e),
                                border: Border.all(
                                  color: const Color(0xff810e2e),
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: const Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          onTap: () async {
                            if (_emailError.isEmpty) {
                              _saveForm();
                              setState(() {
                                showLoading = true;
                              });
                              progressIndicater(context, showLoading = true);
                              if (_emailError.isEmpty) {
                                // Check if email error is still empty after validation
                                FireBaseUser? user = await createUser();
                                userDataProvider.changeId(user!.uid);
                                userDataProvider.saveUserData();
                                await showAlert == true
                                    ? null
                                    : progressIndicater(
                                        context, showLoading = true);
                                Navigator.pop(context);
                              }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, logInScreenRoute);
                          },
                          child: const Text(
                            'Already Registred?',
                            style: TextStyle(
                                color: Color(0xff810e2e),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
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

  createUser() async {
    try {
      FireBaseUser? user = await authService.createUserWithEmailAndPassword(
          emailController.text.toString(), passwordController.text.toString());

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, logInScreenRoute);
      return user;
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
      padding: EdgeInsets.only(left: 10, right: 10),
      title: "ALERT",
      style: AlertStyle(
        descTextAlign: TextAlign.center,
      ),
      desc: e.toString(),
    ).show();
  }
}

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(105, 107, 99, 255),
            Color.fromARGB(105, 212, 65, 141),
          ], begin: Alignment.topLeft, end: Alignment.center),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 7, size.height - 30);
    var firstEndPoint = Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
