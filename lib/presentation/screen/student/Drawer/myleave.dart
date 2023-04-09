// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/logic/provider/leave_provider.dart';
import 'package:provider/provider.dart';

class MyLeave extends StatelessWidget {
  const MyLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Leave> Leavelist = [];
    final leaveprovider = Provider.of<LeaveProvider>(context);
    final leaveListRaw = Provider.of<List<Leave>?>(context);
    leaveListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentUid && element.status == 0) {
        Leavelist.add(element);
      }
    });
    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
        title: const Text(
          'My Rebates',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
      body: Leavelist.isNotEmpty
          ? Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: Leavelist.length,
                itemBuilder: (context, index) {
                  return MyLeaveListModel(
                    leavingdate: Leavelist[index].dateOfLeave,
                    commingdate: Leavelist[index].dateOfComing,
                    leavereason: Leavelist[index].leaveReason,
                    totalday: Leavelist[index].totalDay,
                    deleteleave: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: Text("Are you sure you want to delete ?"),
                          actions: [
                            TextButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                leaveprovider.deleteLeave(Leavelist[index].id);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
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
                    height: 40,
                  ),
                  Text(
                    'No Rebate :)',
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


class MyLeaveListModel extends StatelessWidget {
  MyLeaveListModel(
      {required this.leavingdate,
      required this.commingdate,
      required this.leavereason,
      required this.totalday,
      required this.deleteleave,
      Key? key})
      : super(key: key);

  DateTime leavingdate;
  DateTime commingdate;
  String leavereason;
  int totalday;
  Function deleteleave;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5, bottom: 10),
      child: Container(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, left: 18, right: 18, bottom: 5),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Leaving Date ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(": "),
                              Text(
                                leavingdate.day.toString() +
                                    '/' +
                                    leavingdate.month.toString() +
                                    '/' +
                                    leavingdate.year.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Returning Date ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(": "),
                          Text(
                            commingdate.day.toString() +
                                '/' +
                                commingdate.month.toString() +
                                '/' +
                                commingdate.year.toString() +
                                " ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Days",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("   :   "),
                          Text(
                            "$totalday     ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(16),
                       
                        child: Text(leavereason, style: TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                deleteleave();
                              },
                              child: Container(
                             
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Remove',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Status will be updated soon by the Management.',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
