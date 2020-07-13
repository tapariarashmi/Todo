import 'package:flutter/material.dart';
import 'package:todoey/task_data.dart';
import 'package:provider/provider.dart';

class TaskAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
     // padding:
//EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: EdgeInsets.all(20.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.min,
           children: <Widget>[
    Text(
       'Add Task',
       textAlign: TextAlign.center,
       style: TextStyle(
           
           color:Colors.lightBlueAccent,
           fontSize: 30.0,
       ),
       ),
       TextField(
           autofocus: true,
           style: TextStyle(
     color: Colors.blue,
     fontSize: 25.0,
           ),
           textAlign: TextAlign.center,
     decoration: InputDecoration(
       enabledBorder: UnderlineInputBorder(
           borderSide: BorderSide(color: Colors.lightBlueAccent,)
       )
     ),
     onChanged: (newTask){
       newTaskTitle = newTask;
     }
       ),
       
       FlatButton(
           color: Colors.lightBlueAccent,
           onPressed:(){
     if(newTaskTitle!=null)
       Provider.of<TaskData>(context,listen: false).addNewTask(newTaskTitle);
       Navigator.pop(context);
           },
    child: Text(
      'Add',
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          ),
      ),
    )
           ],
       ),
    );
  }
}

//  padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//          color: Color(0xff757575),