import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/task_data.dart';


class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  
 
 @override
  Widget build(BuildContext context) {
  return Consumer<TaskData>(
      builder: (context,taskData,child){
        return ListView.builder(
          itemBuilder: (context,index){
            final task = taskData.tasks[index];
            return TaskTile(
              name: task.name,
               isChecked:task.isDone,
              checkBoxCallback: (bool checkBoxState){
                 taskData.updateTask(task);
                 },
              deleteTaskCallback: (){
                taskData.deleteTask(task);
              },
            );
          
        },
        itemCount : taskData.taskCount,
        );
      }
       
  );
  }
}