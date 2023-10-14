import 'package:flutter/material.dart';
import 'package:my_todo/dialog_box.dart';
import 'package:my_todo/todo_list.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

//text controller
//So that when you add anew text and you want to add another one,it will not be showing in the text field
final _controller =TextEditingController();

//list of todo tasks
List toDoList=[
["Make bed",false],
["Devotion",false],
];

//checkbox was tapped;what happens when the check box is tapped
void checkboxChanged(bool? value, int index){
setState(() {
toDoList[index][1] =!toDoList[index][1];
});
}
//save New Task
void saveNewTask(){
setState(() {
toDoList.add([_controller.text, false]);
_controller.clear();
});
Navigator.of(context).pop();
}

//delete a Task
void deleteTask(int index){
setState(() {
  toDoList.removeAt(index);
});
}

//create a New Task
void createNewTask(){
showDialog(context: context,
builder: (context){
  return DialogBox(
    controller:  _controller,
    onSave: saveNewTask,
    onCancel: ()=> Navigator.of(context).pop(),
  );
},
);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
      title: const Text("TO DO"),
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: createNewTask,
      child:const Icon(Icons.add),
      ),

    body:ListView.builder(
      itemCount: toDoList.length,
      itemBuilder:(context, index) {
return ToDoList(taskName: toDoList[index][0],
taskCompleted:toDoList[index][1] ,
  onChanged: (value)  => checkboxChanged(value, index),
  deleteFunction: (context) => deleteTask(index),
  );
    },)
    );
  }
}