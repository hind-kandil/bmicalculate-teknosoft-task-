// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Managetasks extends StatefulWidget {
  @override
  State<Managetasks> createState() => _Managetasks();
}

// ignore: must_be_immutable
class todoItem extends StatelessWidget {
  // class for data methods
  String title;
  String description;
  bool fav = false;
  String category;

  todoItem(
      {required this.title,
      required this.description,
      required this.fav,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: Colors.black,
    );
  }
}

  List<todoItem> todoitems = [];

class Tasks {
  // list to store data items


  // method to add task
  void addTask(todoItem task) {
    todoitems.add(task);
  }

  // method to get tasks
  List<todoItem> getalltasks() {
    return List.from(todoitems);
  }

  //method to edit tasks
  void editTask(int index, todoItem edittask) {
    if (index >= 0 || index < todoitems.length) {
      todoitems[index] = edittask;
    }
  }

  //methos to delete tasks
  void deletetask(int index) {
    if (index >= 0 || index < todoitems.length) {
      todoitems.removeAt(index);
    }
  }
}

class _Managetasks extends State<Managetasks> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("add task"),
        ),
        body: Container(
          height: 222,
          width: 222,
          child: ListView.builder(
            itemCount: todoitems.length,
            itemBuilder: (context, index) {
              final task = todoitems[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
              );
            },
          ),
        ),
      ),
    );
  }
}
