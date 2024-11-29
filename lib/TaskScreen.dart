import 'package:flutter/material.dart';

class Taskscreen extends StatefulWidget {
  const Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // Function to get current time in hh:mm AM/PM format
  String getCurrentTime() {
    final now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    String period = hour >= 12 ? "PM" : "AM";

    // Convert to 12-hour format
    if (hour > 12) {
      hour -= 12;
    } else if (hour == 0) {
      hour = 12; // Handle 12:00 AM case
    }

    // Format minutes to always show 2 digits
    String formattedMinute = minute < 10 ? "0$minute" : "$minute";
    return "$hour:$formattedMinute $period";
  }

  // Function to get current date in yyyy-MM-dd format
  String getCurrentDate() {
    final now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int day = now.day;

    // Format month and day to always show 2 digits
    String formattedMonth = month < 10 ? "0$month" : "$month";
    String formattedDay = day < 10 ? "0$day" : "$day";

    return "$year-$formattedMonth-$formattedDay";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add New Task'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              print('Title: ${_titleController.text}');
              print('Content: ${_contentController.text}');
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 93, 230, 98),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _contentController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
       
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              getCurrentTime(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Text(
              getCurrentDate(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
