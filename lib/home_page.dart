// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_apps/dialog_box.dart';

import 'package:todo_apps/todo_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of toDos
  List toDos = [
    // ["Go to gym", false],
    // ["Healthy Breakfast", false],
    // ["Learn Flutter", false],
    // ["Meditation", false]
  ];

  //checkBox function
  void checkBoxClicked(bool? value, int index) {
    setState(() {
      toDos[index][1] = !toDos[index][1];
    });
  }

  //ElevatedButton function on newTaskAdded
  void newTaskAdded() async {
   //Retreive the "File manager"
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   
   

    setState(() {
      toDos.add([_controller.text, false]);
      
    });
     //jsonEncode will transform List to String
   //Because sharedPrefrence only can store string,boolean and int
   //the first 'todos' is the filename
   //
    prefs.setString("toDos", jsonEncode(toDos));

    //to dismiss the alertbox after we add a new task
    Navigator.of(context).pop();
  }

 //when the page is loaded , it will show the previous data that we saved
 @override // take the same function but we want to add more stuff on it
 void initState() {
   super.initState();
   loadData();
 }


 void loadData() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   //Retrieve data
   String? todoString = prefs.getString("toDos");
   if (todoString != null) {
     setState(() {
       // Change from String to List then show it to the UI
       toDos = jsonDecode(todoString);
     });
   }
 }


//AlertDialog on new task
  void newTask() {
    showDialog(
        context: context,
        builder: (((context) {
          return DialogBox(
            controller: _controller,
            onPressed: newTaskAdded,
          );
        })));
  }
  //task removed
  void taskDeleted(int index){
    
     setState(() {
    toDos.removeAt(index);
  });

  // Update shared preferences after removing the item
  updateSharedPrefs();
    
  }
  void updateSharedPrefs() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Serialize the list to a string and save it in shared preferences
  prefs.setString("toDos", jsonEncode(toDos));
}

  //controller for text input
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Icon(Icons.menu_rounded, color: Colors.black, size: 50),
            ),
            SizedBox(height: 20),
            Text(
              "Todo's App",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: newTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: toDos.length,
          itemBuilder: (((context, index) {
            return ToDoTile(
                taskName: toDos[index][0],
                taskCompleted: toDos[index][1],
                onChanged: ((value) => checkBoxClicked(value, index)),taskDeletedButton: (){
                  taskDeleted(index);
                },);
          }))),
    );
  }
}
