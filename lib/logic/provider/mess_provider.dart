import 'package:flutter/cupertino.dart';
import 'package:hostelapplication/logic/modules/mess_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/mess_firestore_service.dart';

class MessProvider with ChangeNotifier {
  final service = MessFirestoreService();
  late String _id;
   late String _sundayB;
  late String _sundayL;
  late String _sundayS;
  late String _sundayD;
  late String _mondayB;
  late String _mondayL;
  late String _mondayS;
  late String _mondayD;
  late String _tuesdayB;
  late String _tuesdayL;
  late String _tuesdayS;
  late String _tuesdayD;
  late String _wednesdayB;
  late String _wednesdayL;
  late String _wednesdayS;
  late String _wednesdayD;
  late String _thursdayB;
  late String _thursdayL;
  late String _thursdayS;
  late String _thursdayD;
  late String _fridayB;
  late String _fridayL;
  late String _fridayS;
  late String _fridayD;
  late String _saturdayB;
  late String _saturdayL;
  late String _saturdayS;
  late String _saturdayD;
  

  // getter
  String get getId => _id;
  String get getSundayB => _sundayB;
  String get getSundayL => _sundayL;
  String get getSundayS => _sundayS;
  String get getSundayD => _sundayD;
  String get getMondayB => _mondayB;
  String get getMondayL => _mondayL;
  String get getMondayS => _mondayS;
  String get getMondayD => _mondayD;
  String get getTuesdayB => _tuesdayB;
  String get getTuesdayL => _tuesdayL;
  String get getTuesdayS => _tuesdayS;
  String get getTuesdayD => _tuesdayD;
  String get getWednesdayB => _wednesdayB;
  String get getWednesdayL => _wednesdayL;
  String get getWednesdayS => _wednesdayS;
  String get getWednesdayD => _wednesdayD;
  String get getThursdayB => _thursdayB;
  String get getThursdayL => _thursdayL;
  String get getThursdayS => _thursdayS;
  String get getThursdayD => _thursdayD;
  String get getFridayB => _fridayB;
  String get getFridayL => _fridayL;
  String get getFridayS => _fridayS;
  String get getFridayD => _fridayD;
  String get getSaturdayB => _saturdayB;
  String get getSaturdayL => _saturdayL;
  String get getSaturdayS => _saturdayS;
  String get getSaturdayD => _saturdayD;



  // setter
  void changeId(String value) {
    _id = value;
  }

  void changeSundayB(String value) {
    if (value != null) {
    _sundayB = value;
  }
  }
  void changeSundayL(String value) {
    _sundayL = value;
  }
  void changeSundayS(String value) {
    _sundayS = value;
  }
  void changeSundayD(String value) {
    _sundayD = value;
  }
  void changeMondayB(String value) {
    _mondayB = value;
  }
  void changeMondayL(String value) {
    _mondayL = value;
  }
  void changeMondayS(String value) {
    _mondayS = value;
  }
  void changeMondayD(String value) {
    _mondayD = value;
  }
  void changeTuesdayB(String value) {
    _tuesdayB = value;
  }
  void changeTuesdayL(String value) {
    _tuesdayL = value;
  }
  void changeTuesdayS(String value) {
    _tuesdayS = value;
  }
  void changeTuesdayD(String value) {
    _tuesdayD = value;
  }
  void changeWednesdayB(String value) {
    _wednesdayB = value;
  }
  void changeWednesdayL(String value) {
    _wednesdayL = value;
  }
  void changeWednesdayS(String value) {
    _wednesdayS = value;
  }
  void changeWednesdayD(String value) {
    _wednesdayD = value;
  }
  void changeThursdayB(String value) {
    _thursdayB = value;
  }
  void changeThursdayL(String value) {
    _thursdayL = value;
  }
  void changeThursdayS(String value) {
    _thursdayS = value;
  }

  void changeThursdayD(String value) {
    _thursdayD = value;
  }
  void changeFridayB(String value) {
    _fridayB = value;
  }
  void changeFridayL(String value) {
    _fridayL = value;
  }
  void changeFridayS(String value) {
    _fridayS = value;
  }
  void changeFridayD(String value) {
    _fridayD = value;
  }
  void changeSaturdayB(String value) {
    _saturdayB = value;
  }
  void changeSaturdayL(String value) {
    _saturdayL = value;
  }
  void changeSaturdayS(String value) {
    _saturdayS = value;
  }
  void changeSaturdayD(String value) {
    _saturdayD = value;
  }



void saveMess() {


  var newMess = Mess(
    id: "123",
    sunday_b: getSundayB,
    sunday_l: getSundayL,
    sunday_s: getSundayS,
    sunday_d: getSundayD,
    monday_b: getMondayB,
    monday_l: getMondayL,
    monday_s: getMondayS,
    monday_d: getMondayD,
    tuesday_b: getTuesdayB,
    tuesday_l: getTuesdayL,
    tuesday_s: getTuesdayS,
    tuesday_d: getTuesdayD,
    wednesday_b: getWednesdayB,
    wednesday_l: getWednesdayL,
    wednesday_s: getWednesdayS,
    wednesday_d: getWednesdayD,
    thursday_b: getThursdayB,
    thursday_l: getThursdayL,
    thursday_s: getThursdayS,
    thursday_d: getThursdayD,
    friday_b: getFridayB,
    friday_l: getFridayL,
    friday_s: getFridayS,
    friday_d: getFridayD,
    saturday_b: getSaturdayB,
    saturday_l: getSaturdayL,
    saturday_s: getSaturdayS,
    saturday_d: getSaturdayD,

   

  );
  service.saveMess(newMess);
}

  void deleteMess(messId) {
    service.removeMess(messId);
  }

  void chageStatus(status, messId) {
    service.changeMessStatus(status, messId);
  }

  void updateSundayB() {
    service.updateSundayB(_sundayB);
  }
  void updateSundayL() {
    service.updateSundayL(_sundayL);
  }
  void updateSundayS() {
    service.updateSundayS(_sundayS);
  }
  void updateSundayD() {
    service.updateSundayD(_sundayD);
  }
  void updateMondayB() {
    service.updateMondayB(_mondayB);
  }
  void updateMondayL() {
    service.updateMondayL(_mondayL);
  }
  void updateMondayS() {
    service.updateMondayS(_mondayS);
  }
  void updateMondayD() {
    service.updateMondayD(_mondayD);
  }
  void updateTuesdayB() {
    service.updateTuesdayB(_tuesdayB);
  }
  void updateTuesdayL() {
    service.updateTuesdayL(_tuesdayL);
  }
  void updateTuesdayS() {
    service.updateTuesdayS(_tuesdayS);
  }
  void updateTuesdayD() {
    service.updateTuesdayD(_tuesdayD);
  }
  void updateWednesdayB() {
    service.updateWednesdayB(_wednesdayB);
  }
  void updateWednesdayL() {
    service.updateWednesdayL(_wednesdayL);
  }
  void updateWednesdayS() {
    service.updateWednesdayS(_wednesdayS);
  }
  void updateWednesdayD() {
    service.updateWednesdayD(_wednesdayD);
  }
  void updateThursdayB() {
    service.updateThursdayB(_thursdayB);
  }
  void updateThursdayL() {
    service.updateThursdayL(_thursdayL);
  }
  void updateThursdayS() {
    service.updateThursdayS(_thursdayS);
  }
  void updateThursdayD() {
    service.updateThursdayD(_thursdayD);
  }
  void updateFridayB() {
    service.updateFridayB(_fridayB);
  }
  void updateFridayL() {
    service.updateFridayL(_fridayL);
  }
  void updateFridayS() {
    service.updateFridayS(_fridayS);
  }
  void updateFridayD() {
    service.updateFridayD(_fridayD);
  }
  void updateSaturdayB() {
    service.updateSaturdayB(_saturdayB);
  }
  void updateSaturdayL() {
    service.updateSaturdayL(_saturdayL);
  }
  void updateSaturdayS() {
    service.updateSaturdayS(_saturdayS);
  }
  void updateSaturdayD() {
    service.updateSaturdayD(_saturdayD);
  }

    
}
