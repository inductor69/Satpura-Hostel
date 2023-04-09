// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:provider/provider.dart';

class DeclineApproveListScreen extends StatelessWidget {
  DeclineApproveListScreen(this.complainStatus, {Key? key}) : super(key: key);
  int complainStatus;

  @override
  Widget build(BuildContext context) {
    List<Complaint> complaintList = [];
    final complaintListRaw = Provider.of<List<Complaint>?>(context);
   
    complaintListRaw?.forEach(
      (element) {
        if (element.status == complainStatus) {
          complaintList.add(element);
        }
        ;
      },
    );
    return Scaffold(
            backgroundColor: Color(0xFFfbd1c0),

      appBar: AppBar(
                backgroundColor: Color(0xFFfbd1c0),

        title: complainStatus == 1
            ? Text('Approved complaints', style: TextStyle(color: Colors.black),)
            : Text('Declined complaints', style: TextStyle(color: Colors.black),),
            
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      complaintList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text('Room - ${complaintList[index].roomNo}'),
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
                                            style: TextStyle(color: Colors.green))
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
                            Divider(color: Colors.black,),
                            Container(
                              padding: const EdgeInsets.all(10),
                             
                              child: Text(
                                complaintList[index].complaint,
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
          :  Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                 
                  ),
                  SizedBox(
                    height: 40,),
                  Text(
                    'No Complaints :/',
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
