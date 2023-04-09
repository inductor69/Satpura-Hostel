// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/approveDenyCompScreen.dart';
import 'package:provider/provider.dart';

class PendingComplainListScreen extends StatelessWidget {
  PendingComplainListScreen(this.complaintTitle, {Key? key}) : super(key: key);
  String complaintTitle;
  @override
  Widget build(BuildContext context) {
    List<Complaint> complaintList = [];
    final complaintListRaw = Provider.of<List<Complaint>?>(context);
    complaintListRaw?.forEach(
      (element) {
        if (complaintTitle == element.complaintTitle && element.status == 0) {
          complaintList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
        title: Text(
          '$complaintTitle Complaints',
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApproveDenyComplainList(
                                  complaintList[index])));
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
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        complaintList[index].name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                          'Room - ${complaintList[index].roomNo}'),
                                      Text(
                                        complaintList[index]
                                                .time
                                                .day
                                                .toString() +
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
                                            fontSize: 12, color: Colors.grey),
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
                                          ? Text('Approved',
                                              style: TextStyle(
                                                  color: Colors.green))
                                          : Text(
                                              'Declined',
                                              style: TextStyle(
                                                color: Colors.red,
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
                            ],
                          ),
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
                    'No Complaints :)',
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
