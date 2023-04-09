import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/provider/mess_provider.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:provider/provider.dart';

class AdminServicesScreen extends StatefulWidget {
  const AdminServicesScreen({Key? key}) : super(key: key);

  @override
  State<AdminServicesScreen> createState() => _AdminServicesScreenState();
}

class _AdminServicesScreenState extends State<AdminServicesScreen> {
  final List<String> textValues = List.generate(28, (index) => '');

  final List<Map<String, String>> labels = [
    {'label': 'Sunday Breakfast', 'value': ''},
    {'label': 'Sunday Lunch', 'value': ''},
    {'label': 'Sunday Snacks', 'value': ''},
    {'label': 'Sunday Dinner', 'value': ''},
    {'label': 'Monday Breakfast', 'value': ''},
    {'label': 'Monday Lunch', 'value': ''},
    {'label': 'Monday Snacks', 'value': ''},
    {'label': 'Monday Dinner', 'value': ''},
    {'label': 'Tuesday Breakfast', 'value': ''},
    {'label': 'Tuesday Lunch', 'value': ''},
    {'label': 'Tuesday Snacks', 'value': ''},
    {'label': 'Tuesday Dinner', 'value': ''},
    {'label': 'Wednesday Breakfast', 'value': ''},
    {'label': 'Wednesday Lunch', 'value': ''},
    {'label': 'Wednesday Snacks', 'value': ''},
    {'label': 'Wednesday Dinner', 'value': ''},
    {'label': 'Thursday Breakfast', 'value': ''},
    {'label': 'Thursday Lunch', 'value': ''},
    {'label': 'Thursday Snacks', 'value': ''},
    {'label': 'Thursday Dinner', 'value': ''},
    {'label': 'Friday Breakfast', 'value': ''},
    {'label': 'Friday Lunch', 'value': ''},
    {'label': 'Friday Snacks', 'value': ''},
    {'label': 'Friday Dinner', 'value': ''},
    {'label': 'Saturday Breakfast', 'value': ''},
    {'label': 'Saturday Lunch', 'value': ''},
    {'label': 'Saturday Snacks', 'value': ''},
    {'label': 'Saturday Dinner', 'value': ''},
  ];

  void getSundayBreakfast(String value) {
    final messProvider = Provider.of<MessProvider>(context, listen: false);

    // Implement logic for Sunday Breakfast
    messProvider.changeSundayB(value);
    messProvider.updateSundayB();
    print('Sunday Breakfast: $value');
  }

  void getSundayLunch(String value) {
    // Implement logic for Sunday Lunch
    final messProvider = Provider.of<MessProvider>(context, listen: false);

    // Implement logic for Sunday Breakfast
    messProvider.changeSundayL(value);
    messProvider.updateSundayL();
    print('Sunday Lunch: $value');
  }

  void getSundaySnacks(String value) {
    // Implement logic for Sunday Snacks
    final messProvider = Provider.of<MessProvider>(context, listen: false);

    // Implement logic for Sunday Breakfast
    messProvider.changeSundayS(value);
    messProvider.updateSundayS();
    print('Sunday Snacks: $value');
  }

  void getSundayDinner(String value) {
    // Implement logic for Sunday Dinner
    final messProvider = Provider.of<MessProvider>(context, listen: false);

    // Implement logic for Sunday Breakfast
    messProvider.changeSundayD(value);
    messProvider.updateSundayD();
    print('Sunday Dinner: $value');
  }

  void getMondayBreakfast(String value) {
    // Implement logic for Monday Breakfast
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeMondayB(value);
    messProvider.updateMondayB();

    print('Monday Breakfast: $value');
  }

  void getMondayLunch(String value) {
    // Implement logic for Monday Lunch
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeMondayL(value);
    messProvider.updateMondayL();

    print('Monday Lunch: $value');
  }

  void getMondaySnacks(String value) {
    // Implement logic for Monday Snacks
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeMondayS(value);
    messProvider.updateMondayS();

    print('Monday Snacks: $value');
  }

  void getMondayDinner(String value) {
    // Implement logic for Monday Dinner
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeMondayD(value);
    messProvider.updateMondayD();

    print('Monday Dinner: $value');
  }

  void getTuesdayBreakfast(String value) {
    // Implement logic for Tuesday Breakfast
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeTuesdayB(value);
    messProvider.updateTuesdayB();

    print('Tuesday Breakfast: $value');
  }

  void getTuesdayLunch(String value) {
    // Implement logic for Tuesday Lunch
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeTuesdayL(value);
    messProvider.updateTuesdayL();

    print('Tuesday Lunch: $value');
  }

  void getTuesdaySnacks(String value) {
    // Implement logic for Tuesday Snacks
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeTuesdayS(value);
    messProvider.updateTuesdayS();
    print('Tuesday Snacks: $value');
  }

  void getTuesdayDinner(String value) {
    // Implement logic for Tuesday Dinner
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeTuesdayD(value);
    messProvider.updateTuesdayD();
    print('Tuesday Dinner: $value');
  }

  void getWednesdayBreakfast(String value) {
    // Implement logic for Wednesday Breakfast
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeWednesdayB(value);
    messProvider.updateWednesdayB();
    print('Wednesday Breakfast: $value');
  }

  void getWednesdayLunch(String value) {
    // Implement logic for Wednesday Lunch
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeWednesdayL(value);
    messProvider.updateWednesdayL();
    print('Wednesday Lunch: $value');
  }

  void getWednesdaySnacks(String value) {
    // Implement logic for Wednesday Snacks
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeWednesdayS(value);
    messProvider.updateWednesdayS();
    print('Wednesday Snacks: $value');
  }

  void getWednesdayDinner(String value) {
    // Implement logic for Wednesday Dinner
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeWednesdayD(value);
    messProvider.updateWednesdayD();
    print('Wednesday Dinner: $value');
  }

  void getThursdayBreakfast(String value) {
    // Implement logic for Thursday Breakfast
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeThursdayB(value);
    messProvider.updateThursdayB();
    print('Thursday Breakfast: $value');
  }

  void getThursdayLunch(String value) {
    // Implement logic for Thursday Lunch
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeThursdayL(value);
    messProvider.updateThursdayL();

    print('Thursday Lunch: $value');
  }

  void getThursdaySnacks(String value) {
    // Implement logic for Thursday Snacks
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeThursdayS(value);
    messProvider.updateThursdayS();

    print('Thursday Snacks: $value');
  }

  void getThursdayDinner(String value) {
    // Implement logic for Thursday Dinner
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeThursdayD(value);
    messProvider.updateThursdayD();
    print('Thursday Dinner: $value');
  }

  void getFridayBreakfast(String value) {
    // Implement logic for Friday Breakfast
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeFridayB(value);
    messProvider.updateFridayB();
    print('Friday Breakfast: $value');
  }

  void getFridayLunch(String value) {
    // Implement logic for Friday Lunch
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeFridayL(value);
    messProvider.updateFridayL();

    print('Friday Lunch: $value');
  }

  void getFridaySnacks(String value) {
    // Implement logic for Friday Snacks
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeFridayS(value);
    messProvider.updateFridayS();

    print('Friday Snacks: $value');
  }

  void getFridayDinner(String value) {
    // Implement logic for Friday Dinner
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeFridayD(value);
    messProvider.updateFridayD();
    print('Friday Dinner: $value');
  }

  void getSaturdayBreakfast(String value) {
    // Implement logic for Saturday Breakfast
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeSaturdayB(value);
    messProvider.updateSaturdayB();

    print('Saturday Breakfast: $value');
  }

  void getSaturdayLunch(String value) {
    // Implement logic for Saturday Lunch
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeSaturdayL(value);
    messProvider.updateSaturdayL();

    print('Saturday Lunch: $value');
  }

  void getSaturdaySnacks(String value) {
    // Implement logic for Saturday Snacks
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeSaturdayS(value);
    messProvider.updateSaturdayS();

    print('Saturday Snacks: $value');
  }

  void getSaturdayDinner(String value) {
    // Implement logic for Saturday Dinner
    final messProvider = Provider.of<MessProvider>(context, listen: false);
    messProvider.changeSaturdayD(value);
    messProvider.updateSaturdayD();

    print('Saturday Dinner: $value');
  }

  void _onCheckMarkTapped(int index) {
    String label = labels[index]['label']!;
    String value = labels[index]['value']!; // Get the value from labels

    // Call different functions based on index
    switch (index) {
      case 0:
        getSundayBreakfast(value);

        break;
      case 1:
        getSundayLunch(value);
        break;
      case 2:
        getSundaySnacks(value);
        break;
      case 3:
        getSundayDinner(value);
        break;
      case 4:
        getMondayBreakfast(value);
        break;
      case 5:
        getMondayLunch(value);
        break;
      case 6:
        getMondaySnacks(value);
        break;
      case 7:
        getMondayDinner(value);
        break;
      case 8:
        getTuesdayBreakfast(value);
        break;
      case 9:
        getTuesdayLunch(value);
        break;
      case 10:
        getTuesdaySnacks(value);
        break;
      case 11:
        getTuesdayDinner(value);
        break;
      case 12:
        getWednesdayBreakfast(value);
        break;
      case 13:
        getWednesdayLunch(value);
        break;
      case 14:
        getWednesdaySnacks(value);
        break;
      case 15:
        getWednesdayDinner(value);
        break;
      case 16:
        getThursdayBreakfast(value);
        break;
      case 17:
        getThursdayLunch(value);
        break;
      case 18:
        getThursdaySnacks(value);
        break;
      case 19:
        getThursdayDinner(value);
        break;
      case 20:
        getFridayBreakfast(value);
        break;
      case 21:
        getFridayLunch(value);
        break;
      case 22:
        getFridaySnacks(value);
        break;
      case 23:
        getFridayDinner(value);
        break;
      case 24:
        getSaturdayBreakfast(value);
        break;
      case 25:
        getSaturdayLunch(value);
        break;
      case 26:
        getSaturdaySnacks(value);
        break;
      case 27:
        getSaturdayDinner(value);
        break;
      default:
        break;
    }
    // Clear the text field

    // Implement your logic here when the check mark is tapped
    print('Check mark tapped for text field: $label');
    // Clear the text field
    setState(() {
      labels[index]['value'] = ''; // Set the value to an empty string
    });
  }

  List<TextEditingController> textControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize the textControllers list with one TextEditingController for each label
    textControllers = List.generate(
      labels.length,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    // Dispose of all the TextEditingController objects to avoid memory leaks
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color(0xFFfbd1c0),
      appBar: AppBar(
          title: const Text(
            'Change Mess Menu',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFfbd1c0),
        ),
                drawer: const AdminDrawer(),

      body: ListView.builder(
        itemCount: labels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textControllers[
                        index], // Assign the appropriate TextEditingController
                    onChanged: (value) {
                      setState(() {
                        labels[index]['value'] = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: labels[index]['label'],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _onCheckMarkTapped(index);
                    textControllers[index]
                        .clear(); // Call clear() on the TextEditingController to clear the text field
// Call clear() on the TextEditingController to clear the text field
                  },
                  icon: Icon(Icons.check),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
