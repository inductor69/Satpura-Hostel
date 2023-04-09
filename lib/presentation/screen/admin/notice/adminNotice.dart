// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:hostelapplication/logic/provider/notice_provider.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    final noticeList = Provider.of<List<Notice>?>(context);
    final noticeProvider = Provider.of<NoticeProvider>(context);
    return Scaffold(
        backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
        title: const Text(
          'Notice Board',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF810e2e),
        onPressed: () {
          Navigator.pushNamed(context, addNoticeScreenRoute);
        },
        child: const Icon(Icons.add),
      ),
      drawer: const AdminDrawer(),
      body: noticeList != null
          ? Padding(
              padding: EdgeInsets.all(12),
              child: ListView.builder(
                  itemCount: noticeList.length,
                  itemBuilder: (context, index) {
                    return NoticeContainer(
                      noticeList[index].notice,
                      noticeList[index].time.day.toString() +
                          '/' +
                          noticeList[index].time.month.toString() +
                          '/' +
                          noticeList[index].time.year.toString(),
                      noticeList[index].url,
                      () {
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
                                  noticeProvider
                                      .deleteNotice(noticeList[index].id);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class NoticeContainer extends StatelessWidget {
  NoticeContainer(this.notice, this.date, this.src, this.delete, {Key? key})
      : super(key: key);
  String notice;
  String date;
  String adminname = "Admin";
  String src;
  Function delete;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
      child: Container(
       padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Color(0xFFfbd1c0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Center(
                    child: Text(
                      "${adminname[0]}",
                     style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500,  color: Colors.black),
                    ),
                    Text(date, style: TextStyle(fontSize: 12,  color: Colors.black)),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    delete();
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
            Divider(),
            const SizedBox(
              height: 5,
            ),
            Text(
              notice,
              style: TextStyle(fontSize: 16,  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
       Center(
  child: src != "" 
    ? Image.network(src)
    : SizedBox(), // Use a SizedBox or any other widget to display when URL is null or empty
),


          ],
        ),
      ),
    );
  }
}
