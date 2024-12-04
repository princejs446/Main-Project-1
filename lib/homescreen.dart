import 'package:flutter/material.dart';
import 'package:main_project1/ListScreen.dart';
import 'package:main_project1/Listscreen_grid.dart';
import 'package:main_project1/TaskScreen.dart';
import 'package:main_project1/Taskscreen_grid.dart';
import 'package:main_project1/TextScreen.dart';
import 'package:main_project1/Textscreen_grid.dart';
import 'package:main_project1/appwriteservice.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late AppwriteService _appwriteService;
  final _titlecontroller = TextEditingController();
  final _contentcontroller = TextEditingController();
  bool isFABVisible = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 234, 16),
          title: Text(
            "Echo Note",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Text'),
              Tab(text: 'List'),
              Tab(text: 'Task'),
            ],
          ),
        ),
        floatingActionButton: isFABVisible
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isFABVisible = false;
                  });
                },
                backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        body: Stack(
          children: [
            TabBarView(
              children: [
              Textscreen_grid(),
              TaskScreen_grid(),
              ListScreen_grid(),
              ],
            ),
            if (!isFABVisible)
              Positioned(
                right: 10,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => Taskscreen()),
                        );
                      },
                      mini: true,
                      backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                      child: Icon(Icons.add_task),
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => Listscreen()),
                        );
                      },
                      mini: true,
                      backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                      child: Icon(Icons.check_box),
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => Textscreen()),
                        );
                      },
                      backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                      child: Icon(Icons.notes),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
