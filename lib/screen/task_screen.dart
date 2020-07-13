import 'package:flutter/material.dart';
import 'package:todoey/task_data.dart';
import 'package:todoey/constants.dart';
import 'task_add.dart';
import 'task_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget{
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
   @override
  void initState() {
   
    super.initState();
    Provider.of<TaskData>(context,listen: false).updateListView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          ),
          onPressed: (){
              showModalBottomSheet(context: context,
                 shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        //isScrollControlled: true, 
              builder: (context)=> TaskAdd());
          },
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children : <Widget>[
            Container(
                padding: EdgeInsets.all(35.0),
        //padding: EdgeInsets.only(top: 40.0,right:30.0,left:30.0,bottom:30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white, 
                radius: 30.0,
                child:Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
              size: 30.0,
              ),
                ),
                SizedBox(
              height: 10.0,
                ),
              Text(
                'Todoey',
                style: kHeadStyle,
                ),
                 Text(
                '${Provider.of<TaskData>(context).taskCount} Tasks',
                style: kTaskStyle,
                ),
        ],
        ),
      ),
            Expanded(
      //flex: 3,
            child:Container(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      decoration: kBottomContainerDecoration,
      child: TaskList(),
            ),
            ),
          ],
        ),
    );
  }
}

 

