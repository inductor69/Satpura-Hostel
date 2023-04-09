import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
import 'package:provider/provider.dart';

class StudentApproveDennyLeaveList extends StatelessWidget {
  const StudentApproveDennyLeaveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Leave> leaveList = [];
    final leaveListRaw = Provider.of<List<Leave>?>(context);

    leaveListRaw?.forEach(
      (element) {
        if (element.studentUid == auth.currentUser?.uid &&
            (element.status == 2 || element.status == 1)) {
          leaveList.add(element);
        }
        ;
      },
    );
    return Scaffold(
              backgroundColor: Color(0xFFfbd1c0),

      appBar: AppBar(
        title: const Text(
          'Mess Rebate',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
      drawer: const StudentDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, studentLeaveScreenRoute);
        },
      
        backgroundColor: Color(0xFFFEFFFE),
        
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: leaveList.length != 0
          ? Container(
                    padding: const EdgeInsets.all(12.0),

              decoration: BoxDecoration(color: Color(0xFFfbd1c0)),
              
              child: ListView.builder(
                itemCount: leaveList.length,
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
                      // add border only to top and bottom only
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
                                      leaveList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Room - ${leaveList[index].roomNo}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      leaveList[index]
                                              .leaveApplyDate
                                              .day
                                              .toString() +
                                          '/' +
                                          leaveList[index]
                                              .leaveApplyDate
                                              .month
                                              .toString() +
                                          '/' +
                                          leaveList[index]
                                              .leaveApplyDate
                                              .year
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade800),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                leaveList[index].status == 0
                                    ? Text(
                                        '\u2022 Pending',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            214,
                                            108,
                                            22,
                                          ),
                                        ),
                                      )
                                    : leaveList[index].status == 1
                                        ? Text(
                                            '\u2022 Approved',
                                            style: TextStyle(
                                                color: Colors.green.shade900),
                                          )
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '\u2022 ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                      
                                        TextSpan(
                                          text:
                                              leaveList[index].leaveReason,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                    'No Verified Rebate :/',
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
