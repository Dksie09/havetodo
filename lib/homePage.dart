import 'package:flutter/material.dart';
import 'ToDoTile.dart';
import 'appwrite.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List toDoList = [];

  void checkBoxChanged(bool? isDone, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  String taskText = "";
  void addTodo() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Add Todo"),
              content: TextField(
                onChanged: (value) {
                  taskText = value;
                },
                decoration: InputDecoration(hintText: "Enter your todo"),
              ),
              actions: [
                ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        toDoList.add([taskText, false]);
                      });
                      addDoc(taskText);
                      toDoList = getDoc();
                      taskText = "";
                      Navigator.pop(context);
                    }),
                    child: Text("Add")),
                ElevatedButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Text("Cancel"))
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TO DO"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return toDoTile(
              task: toDoList[index][0],
              isDone: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addTodo,
          child: Icon(Icons.add),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
