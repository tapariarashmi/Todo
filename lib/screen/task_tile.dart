import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {
final int isChecked;
 final String name;
 final Function checkBoxCallback;
 final Function deleteTaskCallback;
 //TaskTile({this.name,this.deleteTaskCallback,this.isChecked});
 TaskTile({this.name,this.isChecked,this.checkBoxCallback,this.deleteTaskCallback});
   @override
  Widget build(BuildContext context) {
    bool value;
    if(isChecked==1)
    value = true;
    else
    value=false;

    return ListTile(
      onLongPress: deleteTaskCallback,
    title: Text(
      name,
      style: TextStyle(
        decoration: value? TextDecoration.lineThrough:null,
      ),
      ),
    trailing: Checkbox(
        value: value,
        onChanged:checkBoxCallback ,
        
      ),
      );
  }
}

