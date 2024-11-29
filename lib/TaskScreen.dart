import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class Taskscreen extends StatefulWidget {
  const Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  
  String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('hh:mm a').format(now);
  }

  
  String getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now); 
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
