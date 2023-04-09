// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:hostelapplication/presentation/screen/student/Drawer/mycomplaint.dart';
import 'package:hostelapplication/presentation/screen/student/Drawer/myleave.dart';
import 'package:hostelapplication/presentation/screen/student/Drawer/myservices.dart';
import 'package:provider/provider.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? userData;
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
    List<UserData> complaintList = [];
    final complaintListRaw = Provider.of<List<UserData>?>(context);
    complaintListRaw?.forEach((element) {
      if (user.uid == element.id) {
        complaintList.add(element);
      } else
        return null;
      ;
    });
    const studentDrawerText = TextStyle(fontSize: 15);
    return Drawer(
      child: Container(
        color: Color(0xFFfbd1c0),
        child: SafeArea(
          child: complaintList.length == 0
              ? Container()
              : ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    // _createHeader(),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, studentDetailScreenRoute);
                      },
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 75,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          complaintList.first.userimage),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        complaintList.first.firstName +
                                            ' ' +
                                            complaintList.first.lastName,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "View Profile",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 50, child: Divider()),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.book,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'My Complaints',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mycomplaints()));
                      },
                    ),
                    const SizedBox(width: 50, child: Divider()),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text('My Rebates',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyLeave()));
                      },
                    ),

                    const SizedBox(width: 50, child: Divider()),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.question,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text('Help',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, helpscreenRoute);
                      },
                    ),

                    Divider(),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.code,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text('Developer',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, developer);
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.signOut,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text('Log out',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      onTap: () {
                        authService.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                            context, logInScreenRoute, (route) => false);
                      },
                    ),
                    const SizedBox(width: 50, child: Divider()),
                  ],
                ),
        ),
      ),
    );
  }
}
