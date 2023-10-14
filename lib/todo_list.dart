import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoList({super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:23, right:23, top:23),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius:BorderRadius.circular(12),
            )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blue,
          borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
      //checkbox
              Checkbox(value: taskCompleted,
              onChanged: onChanged,
              activeColor:Colors.black,
              ),
              //Text name
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 18,
              decoration: taskCompleted
              ? TextDecoration.lineThrough
              :TextDecoration.none,
                ),
                ),
            ],
            ),
        ),
      ),
    );
  }
}