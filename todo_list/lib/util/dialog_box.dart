import 'package:flutter/material.dart';
import 'package:todo_list/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCalcel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCalcel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new Task",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save Button
                MyButton(title: "Save", onClick: onSave),

                SizedBox(width: 8),

                // Cancel Button
                MyButton(title: "Cancel", onClick: onCalcel),
              ],

            ),
          ],
        ),
      ),
    );
  }
}
