import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/string.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const helpstyle = TextStyle(
        color: Color(0xff810e2e), fontWeight: FontWeight.bold, fontSize: 20);
    return Scaffold(
      backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFfbd1c0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.home,
                                  color: Color(0xff810e2e),
                                ),
                              ),
                              TextSpan(
                                  text: '   Home Screen', style: helpstyle),
                            ],
                          ),
                        ),
                      ),
                      BulletList(const [
                        "Here you can see the all updates regarding Satpura Hostel. The information posted here is officially approved by management."
                      ]),
                      const Divider(thickness: 1),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.feedback,
                                  color: Color(0xff810e2e),
                                ),
                              ),
                              TextSpan(
                                  text: '   Complaint Screen ',
                                  style: helpstyle),
                            ],
                          ),
                        ),
                      ),
                      BulletList(const [
                        "Here you are able to post your complaints you are facing during your stay at Satpura Hostel.",
                        "Upon the submission of your complaint, you'll get a status message regarding if the complaint was accepted or not."
                      ]),
                      const Divider(thickness: 1),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.lunch_dining,
                                  color: Color(0xff810e2e),
                                ),
                              ),
                              TextSpan(
                                  text: '   Mess Service Screen ',
                                  style: helpstyle),
                            ],
                          ),
                        ),
                      ),
                      BulletList(const [
                        "You can see today's menu of Satpura here.",
                      ]),
                      const Divider(thickness: 1),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xff810e2e),
                                ),
                              ),
                              TextSpan(
                                  text: '   Mess Rebate Screen ',
                                  style: helpstyle),
                            ],
                          ),
                        ),
                      ),
                      BulletList(const [
                        "You can add mess rebate request here.",
                        "You can also see the status of your rebate request."
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            // GestureDetector(
            //   onTap: (){
            //     Navigator.pushNamed(context, onboardingScreen);
            //   },
            //   child: Center(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: const [
            //         Text("Onboarding Screens",
            //             style: TextStyle(
            //                 color: Colors.blue,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 16)),
            //         Icon(
            //           Icons.arrow_forward,
            //           color: Colors.blue,
            //           size: 20,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> strings;

  BulletList(this.strings);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(8, 10, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '\u2022',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.7,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.8),
                    height: 1.7,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
