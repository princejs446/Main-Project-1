import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Echo Note",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 93, 230, 98),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Text'),
              Tab(text: 'List'),
              Tab(text: 'Task'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Replace ListTile with IconButton for each option
                      IconButton(
                        icon: Icon(Icons.text_fields, size: 30),
                        onPressed: () {
                          // Add your action here
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: 10),
                      IconButton(
                        icon: Icon(Icons.list, size: 30),
                        onPressed: () {
                          // Add your action here
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: 10),
                      IconButton(
                        icon: Icon(Icons.check_box, size: 30),
                        onPressed: () {
                          // Add your action here
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: const Color.fromARGB(255, 93, 230, 98),
          child: Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}
