import 'package:flutter/material.dart';
import 'package:main_project1/ListScreen.dart';
import 'package:main_project1/TaskScreen.dart';
import 'package:main_project1/TextScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool _showBottomIcons = false;

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
        body: Stack(
          children: [
            // Main Tab Content
            TabBarView(
              children: [
                Center(child: Text('Text Tab Content')),
                Center(child: Text('List Tab Content')),
                Center(child: Text('Task Tab Content')),
              ],
            ),
            // Floating bottom icons
            if (_showBottomIcons)
              Positioned(
                bottom: 90,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: const Color.fromARGB(255, 93, 230, 98),
                      child: Icon(Icons.notes, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _showBottomIcons = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Textscreen()),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: const Color.fromARGB(255, 93, 230, 98),
                      child: Icon(Icons.list, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _showBottomIcons = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Listscreen()),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: const Color.fromARGB(255, 93, 230, 98),
                      child: Icon(Icons.check_box, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _showBottomIcons = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Taskscreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _showBottomIcons = !_showBottomIcons;
            });
          },
          backgroundColor: const Color.fromARGB(255, 93, 230, 98),
          child: Icon(_showBottomIcons ? Icons.close : Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}
