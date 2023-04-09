class Mess {
  String id;
  String sunday_b;
  String sunday_l;
  String sunday_s;
  String sunday_d;
  String monday_b;
  String monday_l;
  String monday_s;
  String monday_d;
  String tuesday_b;
  String tuesday_l;
  String tuesday_s;
  String tuesday_d;
  String wednesday_b;
  String wednesday_l;
  String wednesday_s;
  String wednesday_d;
  String thursday_b;
  String thursday_l;
  String thursday_s;
  String thursday_d;
  String friday_b;
  String friday_l;
  String friday_s;
  String friday_d;
  String saturday_b;
  String saturday_l;
  String saturday_s;
  String saturday_d;
  


  Mess(
    {
    required this.id,
    required this.sunday_b,
    required this.sunday_l,
    required this.sunday_s,
    required this.sunday_d,
    required this.monday_b,
    required this.monday_l,
    required this.monday_s,
    required this.monday_d,
    required this.tuesday_b,
    required this.tuesday_l,
    required this.tuesday_s,
    required this.tuesday_d,
    required this.wednesday_b,
    required this.wednesday_l,
    required this.wednesday_s,
    required this.wednesday_d,
    required this.thursday_b,
    required this.thursday_l,
    required this.thursday_s,
    required this.thursday_d,
    required this.friday_b,
    required this.friday_l,
    required this.friday_s,
    required this.friday_d,
    required this.saturday_b,
    required this.saturday_l,
    required this.saturday_s,
    required this.saturday_d,

  });

  Map<String, dynamic> createMap() {
    return {'id': id, 'sunday_b': sunday_b, 'sunday_l': sunday_l, 'sunday_s': sunday_s, 'sunday_d': sunday_d, 'monday_b': monday_b, 'monday_l': monday_l, 'monday_s': monday_s, 'monday_d': monday_d, 'tuesday_b': tuesday_b, 'tuesday_l': tuesday_l, 'tuesday_s': tuesday_s, 'tuesday_d': tuesday_d, 'wednesday_b': wednesday_b, 'wednesday_l': wednesday_l, 'wednesday_s': wednesday_s, 'wednesday_d': wednesday_d, 'thursday_b': thursday_b, 'thursday_l': thursday_l, 'thursday_s': thursday_s, 'thursday_d': thursday_d, 'friday_b': friday_b, 'friday_l': friday_l, 'friday_s': friday_s, 'friday_d': friday_d, 'saturday_b': saturday_b, 'saturday_l': saturday_l, 'saturday_s': saturday_s, 'saturday_d': saturday_d, };
  }

  Mess.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['id'],
      sunday_b = firestoreMap['sunday_b'],
      sunday_l = firestoreMap['sunday_l'],
      sunday_s = firestoreMap['sunday_s'],
      sunday_d = firestoreMap['sunday_d'],
      monday_b = firestoreMap['monday_b'],
      monday_l = firestoreMap['monday_l'],
      monday_s = firestoreMap['monday_s'],
      monday_d = firestoreMap['monday_d'],
      tuesday_b = firestoreMap['tuesday_b'],
      tuesday_l = firestoreMap['tuesday_l'],
      tuesday_s = firestoreMap['tuesday_s'],
      tuesday_d = firestoreMap['tuesday_d'],
      wednesday_b = firestoreMap['wednesday_b'],
      wednesday_l = firestoreMap['wednesday_l'],
      wednesday_s = firestoreMap['wednesday_s'],
      wednesday_d = firestoreMap['wednesday_d'],
      thursday_b = firestoreMap['thursday_b'],
      thursday_l = firestoreMap['thursday_l'],
      thursday_s = firestoreMap['thursday_s'],
      thursday_d = firestoreMap['thursday_d'],
      friday_b = firestoreMap['friday_b'],
      friday_l = firestoreMap['friday_l'],
      friday_s = firestoreMap['friday_s'],
      friday_d = firestoreMap['friday_d'],
      saturday_b = firestoreMap['saturday_b'],
      saturday_l = firestoreMap['saturday_l'],
      saturday_s = firestoreMap['saturday_s'],
      saturday_d = firestoreMap['saturday_d'];
       


}
