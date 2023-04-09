// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';

class StudentPastComplaintScreen extends StatelessWidget {
  StudentPastComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
    List<Complaint> complaintList = [];
    final complaintListRaw = Provider.of<List<Complaint>?>(context);

    complaintListRaw?.forEach(
      (element) {
        if (user.uid == element.studentUid &&
            (element.status == 1 || element.status == 2)) {
          complaintList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
        title: const Text(
          'Past Complaints',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
      body: complaintList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: complaintList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: new BoxDecoration(
                        color: Color(0xFFFEFFFE),
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
                      color: Color(0xFFFEFFFE),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      complaintList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Room - ${complaintList[index].roomNo}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      complaintList[index].time.day.toString() +
                                          '/' +
                                          complaintList[index]
                                              .time
                                              .month
                                              .toString() +
                                          '/' +
                                          complaintList[index]
                                              .time
                                              .year
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade800),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                complaintList[index].status == 0
                                    ? Text(
                                        'Pending',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            214,
                                            108,
                                            22,
                                          ),
                                        ),
                                      )
                                    : complaintList[index].status == 1
                                        ? Text('\u2022 Approved',
                                            style: TextStyle(
                                                color: Colors.green.shade900))
                                        : Text(
                                            '\u2022 Declined',
                                            style: TextStyle(
                                              color: Colors.red.shade900,
                                            ),
                                          ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(thickness: 2),
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                '\u2022 ' + complaintList[index].complaint,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                 
                  ),
                  SizedBox(
                    height: 40,),
                  Text(
                    'No Verified Complaints :/',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
    );
  }
}
