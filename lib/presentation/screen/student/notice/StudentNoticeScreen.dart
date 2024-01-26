// ignore_for_file: must_be_immutable

import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../../../logic/modules/userData_model.dart';
import '../../../../logic/service/auth_services/auth_service.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(String id, int status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
    List<UserData> userDataList = [];
    final userDataListRaw = Provider.of<List<UserData>?>(context);
    userDataListRaw?.forEach((element) {
      if (user.uid == element.id) {
        userDataList.add(element);
      }
      ;
    });
    final noticeList = Provider.of<List<Notice>?>(context);

    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
        title: const Text(
          'Notice Board',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
      drawer: const StudentDrawer(),
      body: noticeList != null
          ? Container(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Irasshaimase',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              userDataList.first.firstName + '!',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(6.0),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class NoticeContainer extends StatelessWidget {
  NoticeContainer(this.notice, this.date, this.src, {Key? key})
      : super(key: key);
  String notice;
  String date;
  String name = "Admin";
  String src;

  var myMenuItems = <String>[
    'Save Image',
  ];

  void onSelect(item) async {
    var localDirectory = await getApplicationDocumentsDirectory();

    switch (item) {
      case 'Save Image':
        await FlutterDownloader.enqueue(
          url: src,
          headers: {}, // optional: header send with url (auth token etc)
          savedDir: localDirectory.path,
          saveInPublicStorage:
              true, // optional: set true if you want to save in external storage
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
        break;
    }
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 25,
                          child: Center(
                            child: Text(
                              "${name[0]}",
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
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(date,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    PopupMenuButton<String>(
                      onSelected: onSelect,
                      itemBuilder: (BuildContext context) {
                        return myMenuItems.map((String choice) {
                          return PopupMenuItem<String>(
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                iconTheme: IconThemeData(
                                    color: Colors
                                        .black), // Specify the desired icon color
                              ),
                              child: Text(choice),
                            ),
                            value: choice,
                          );
                        }).toList();
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BulletLists(
                  notice,
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
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class BulletLists extends StatelessWidget {
  BulletLists(this.str);
  final String str;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '\u2022',
              style: TextStyle(fontSize: 20, height: 1.55, color: Colors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                "${str}",
                textAlign: TextAlign.left,
                softWrap: true,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  height: 1.55,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
