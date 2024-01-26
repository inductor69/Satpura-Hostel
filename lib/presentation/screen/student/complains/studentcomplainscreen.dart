import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/complains/studentPastComplaint.dart';
import 'package:hostelapplication/presentation/screen/student/complains/studentAddComplain.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentComplainScreen extends StatefulWidget {
  const StudentComplainScreen({Key? key}) : super(key: key);

  @override
  State<StudentComplainScreen> createState() => _StudentComplainScreenState();
}

class _StudentComplainScreenState extends State<StudentComplainScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<String> images = [
    'assets/images/water-bottle.png',
    'assets/images/electrical-energy.png',
    'assets/images/chef.png',
    'assets/images/insects.png',
    'assets/images/other.png'
  ];
  List<String> imagesText = [
    'Water',
    'Electricity',
    'Staff',
    'Bugs & Insects',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
        title: const Text(
          'Add Complaints',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudentPastComplaintScreen()));
        },
        backgroundColor: Color(0xFFFEFFFE),
        child: Icon(
          Icons.comment,
          color: Colors.black,
        ),
      ),
      drawer: const StudentDrawer(),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xFFfbd1c0),
        ),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentAddComplaintScreen(
                            imagesText[index], user!.uid)));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                    color: Color(0xFFFFFEF5),
                    border: Border(
                        left: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        top: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                          width: 4,
                        ),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 4,
                        ))),
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          images[index],
                          height: 100,
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Text(
                          textAlign: TextAlign.center,
                          imagesText[index].toString(),
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
