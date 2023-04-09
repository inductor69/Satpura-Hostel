// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:hostelapplication/presentation/screen/admin/leave/approveDenyLeave.dart';
import 'package:hostelapplication/presentation/screen/admin/leave/declineApproveLeaveListScreen.dart';
import 'package:provider/provider.dart';

class AdminLeaveScreen extends StatefulWidget {
  const AdminLeaveScreen({Key? key}) : super(key: key);

  @override
  State<AdminLeaveScreen> createState() => _AdminLeaveScreenState();
}

class _AdminLeaveScreenState extends State<AdminLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    List<Leave> leaveList = [];
    final leaveListRaw = Provider.of<List<Leave>?>(context);
    leaveListRaw?.forEach(
      (element) {
        if (element.status == 0) {
          leaveList.add(element);
        } else null;
        ;
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        title: const Text(
          'Mess Rebate',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
        drawer: const AdminDrawer(),
        body: 
        Container(
                        decoration: BoxDecoration(color: Color(0xFFfbd1c0)),

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                leaveList.length == 0 ? 
                Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                 
                  ),
                  SizedBox(
                    height: 40,),
                  Text(
                    'No Rebate Requests :)',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            )
                : 
                Container(
                  padding: EdgeInsets.only(bottom: 120),
                  child: ListView.builder(
                    itemCount: leaveList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ApproveDennyLeaveScreen(leaveList[index])));
                        },
                        child: adminleavelistmodel(
                            studentname: leaveList[index].name,
                            roomno: leaveList[index].roomNo),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
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
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DeclineApproveLeaveListScreen(1),
                                ),
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Apporoved Rebates',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DeclineApproveLeaveListScreen(2),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Declined Rebates',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class adminleavelistmodel extends StatelessWidget {
  adminleavelistmodel(
      {required this.studentname, required this.roomno, Key? key})
      : super(key: key);
  String studentname;
  String roomno;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0,
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
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$studentname",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text('Room No. : $roomno', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
