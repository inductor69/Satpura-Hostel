import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/leave/studentLeaveList.dart';
import 'package:hostelapplication/presentation/screen/student/notice/StudentNoticeScreen.dart';
import 'package:hostelapplication/presentation/screen/student/services/studentServices.dart';
import 'package:hostelapplication/presentation/screen/student/complains/studentcomplainscreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}
class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    StudentHome(),
    StudentComplainScreen(),
    StudentServicesScreen(),
    StudentApproveDennyLeaveList()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: CurvedNavigationBar(
      backgroundColor:Color(0xFFfbd1c0),
      color: Colors.white,
      height: 50,
      buttonBackgroundColor: Color(0xFFfbd1c0),
      animationDuration: Duration(milliseconds: 200),
      index: _selectedIndex,
      onTap: _onItemTapped,
      items: <Widget>[
        Icon(Icons.home, size: 30, color: Colors.black),
        Icon(Icons.feedback, size: 30, color: Colors.black),
        Icon(Icons.lunch_dining, size: 30, color: Colors.black),
        Icon(Icons.person, size: 30, color: Colors.black ),
      ],
    ),
    body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex))
  );
}

}
