import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/mess_model.dart';

class MessFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveMess(Mess mess) {
    return _db.collection('Mess').doc(mess.id).set(mess.createMap());
  }

  Stream<List<Mess>> getMess() {
    return _db
        .collection('Mess')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Mess.fromFirestore(document.data()))
            .toList());
  }

   Future<void> removeMess(String messId) {
    return _db.collection('Mess').doc(messId).delete();
  }

  Future<void> changeMessStatus(int status,String messId) {
    return _db.collection('Mess').doc(messId).set({
      'Status' : status
    },
    SetOptions(
            merge: true,
          ),
    );
  }

  Future<void> updateSundayB(String sundayB) {
    return _db.collection('Mess').doc('123').set({
      'sunday_b' : sundayB,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateSundayL(String sundayL) {
    return _db.collection('Mess').doc('123').set({
      'sunday_l' : sundayL,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateSundayS(String sundayS) {
    return _db.collection('Mess').doc('123').set({
      'sunday_s' : sundayS,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateSundayD(String sundayD) {
    return _db.collection('Mess').doc('123').set({
      'sunday_d' : sundayD,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateMondayB(String mondayB) {
    return _db.collection('Mess').doc('123').set({
      'monday_b' : mondayB,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateMondayL(String mondayL) {
    return _db.collection('Mess').doc('123').set({
      'monday_l' : mondayL,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateMondayS(String mondayS) {
    return _db.collection('Mess').doc('123').set({
      'monday_s' : mondayS,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateMondayD(String mondayD) {
    return _db.collection('Mess').doc('123').set({
      'monday_d' : mondayD,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateTuesdayB(String tuesdayB) {
    return _db.collection('Mess').doc('123').set({
      'tuesday_b' : tuesdayB,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateTuesdayL(String tuesdayL) {
    return _db.collection('Mess').doc('123').set({
      'tuesday_l' : tuesdayL,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateTuesdayS(String tuesdayS) {
    return _db.collection('Mess').doc('123').set({
      'tuesday_s' : tuesdayS,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateTuesdayD(String tuesdayD) {
    return _db.collection('Mess').doc('123').set({
      'tuesday_d' : tuesdayD,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateWednesdayB(String wednesdayB) {
    return _db.collection('Mess').doc('123').set({
      'wednesday_b' : wednesdayB,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateWednesdayL(String wednesdayL) {
    return _db.collection('Mess').doc('123').set({
      'wednesday_l' : wednesdayL,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateWednesdayS(String wednesdayS) {
    return _db.collection('Mess').doc('123').set({
      'wednesday_s' : wednesdayS,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateWednesdayD(String wednesdayD) {
    return _db.collection('Mess').doc('123').set({
      'wednesday_d' : wednesdayD,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateThursdayB(String thursdayB) {
    return _db.collection('Mess').doc('123').set({
      'thursday_b' : thursdayB,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateThursdayL(String thursdayL) {
    return _db.collection('Mess').doc('123').set({
      'thursday_l' : thursdayL,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateThursdayS(String thursdayS) {
    return _db.collection('Mess').doc('123').set({
      'thursday_s' : thursdayS,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateThursdayD(String thursdayD) {
    return _db.collection('Mess').doc('123').set({
      'thursday_d' : thursdayD,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateFridayB(String fridayB) {
    return _db.collection('Mess').doc('123').set({
      'friday_b' : fridayB,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateFridayL(String fridayL) {
    return _db.collection('Mess').doc('123').set({
      'friday_l' : fridayL,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateFridayS(String fridayS) {
    return _db.collection('Mess').doc('123').set({
      'friday_s' : fridayS,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateFridayD(String fridayD) {
    return _db.collection('Mess').doc('123').set({
      'friday_d' : fridayD,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateSaturdayB(String saturdayB) {
    return _db.collection('Mess').doc('123').set({
      'saturday_b' : saturdayB,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateSaturdayL(String saturdayL) {
    return _db.collection('Mess').doc('123').set({
      'saturday_l' : saturdayL,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateSaturdayS(String saturdayS) {
    return _db.collection('Mess').doc('123').set({
      'saturday_s' : saturdayS,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  Future<void> updateSaturdayD(String saturdayD) {
    return _db.collection('Mess').doc('123').set({
      'saturday_d' : saturdayD,
    },
     SetOptions(
            merge: true,
          ),

    );
  }
  



}
