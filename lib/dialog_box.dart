import 'package:flutter/material.dart';
import 'package:my_todo/my_buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
  required this.controller,
  required this.onSave,
  required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[300],
      content:Container(
        height:120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user Input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //button to save
                MyButtons(text: "Save",
                onPressed: onSave,
                ),
                const SizedBox(width: 8,),
                //button to cancel
                MyButtons(text: "Cancel",
                onPressed:onCancel,
                ),
              ],
            ),
          ],
        ),
        ),
    );
  }
}
