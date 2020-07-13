import 'package:flutter/foundation.dart';
import 'screen/tasks.dart';
import 'dart:collection';
import 'package:todoey/Utils/database.dart';
import 'package:sqflite/sqflite.dart';

DatabaseHelper databaseHelper = DatabaseHelper();

class TaskData extends ChangeNotifier{
    List<Tasks> _tasks =[];

    
    UnmodifiableListView<Tasks> get tasks {
    return UnmodifiableListView(_tasks);
  }


  int get taskCount{
    return _tasks.length;
  }
  void addNewTask(String newTaskTitle) async{
    Tasks todo = Tasks(name: newTaskTitle);
    //_tasks.add(todo);
    int result = await databaseHelper.insertTodo(todo);
    print(result);
    updateListView();
    notifyListeners();
  }
  void updateTask(Tasks task) async{
    task.toggleIsDone();
    int result = await databaseHelper.updateTodo(task);
    print(result);
    updateListView();
    notifyListeners();
  }
  void deleteTask(Tasks task) async{
    //_tasks.remove(task);
    int result = await databaseHelper.deleteTodo(task.id);
    print(result);
    updateListView();
    notifyListeners();
  }

   void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Tasks>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((todoList) {

        this._tasks = todoList;
        notifyListeners();
        // setState(() {
        //   this.todoList = todoList;
        //   this.count = todoList.length;
        // });
      });
    });
  }
}