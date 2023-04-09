// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/logic/provider/leave_provider.dart';
import 'package:provider/provider.dart';

class ApproveDennyLeaveScreen extends StatelessWidget {
  ApproveDennyLeaveScreen(this.leave, {Key? key}) : super(key: key);
  Leave leave;

  @override
  Widget build(BuildContext context) {
    final leaveProvider = Provider.of<LeaveProvider>(context);
    const tablepadding = EdgeInsets.all(15);
    return Scaffold(
                backgroundColor: Color(0xFFfbd1c0),

      appBar: AppBar(
          title: const Text(
            'Approve/Deny Leaves',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFfbd1c0),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, left: 18, right: 18, bottom: 50),
              child: Container(
               clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 2, color: Colors.black),
                            ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Table(
                          // defaultColumnWidth: FixedColumnWidth(120.0),
                          columnWidths: const {
                            0: FixedColumnWidth(120),
                            1: FlexColumnWidth(),
                          },
                          border: TableBorder.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              borderRadius: BorderRadius.circular(10),
                              width: 1),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Center(
                                    child: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: tablepadding,
                                child: Column(children: [
                                  Text(
                                    leave.name,
                                    style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.black),
                                  )
                                ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    'Room No.',
                                    style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.black),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: tablepadding,
                                child: Column(children: [
                                  Text(
                                    leave.roomNo,
                                    style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.black),
                                  )
                                ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    'Date of leaving',
                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                      color: Colors.black),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(25),
                                child: Column(children: [
                                  Text(
                                    leave.dateOfLeave.day.toString() +
                                        '/' +
                                        leave.dateOfLeave.month.toString() +
                                        '/' +
                                        leave.dateOfLeave.year.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    'Date Of coming',
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(25),
                                child: Column(children: [
                                  Text(
                                    leave.dateOfComing.day.toString() +
                                        '/' +
                                        leave.dateOfComing.month.toString() +
                                        '/' +
                                        leave.dateOfComing.year.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    'Total Day',
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: tablepadding,
                                child: Column(children: [
                                  Text(
                                    "${leave.totalDay}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      " Rebate Reason",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                     
                      child: Text(leave.leaveReason, style: TextStyle(fontSize: 16),),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              leaveProvider.chageStatus(2, leave.id);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20))),
                              height: 50,
                              child: const Center(
                                child: Text(
                                  'Deny',
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
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              leaveProvider.chageStatus(1, leave.id);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20))),
                              height: 50,
                              child: const Center(
                                child: Text(
                                  'Approve',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
