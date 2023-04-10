// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.controller, required this.onPressed});

  final controller;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Text(
              "Add Task",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Add new task",
              ),
              textAlign: TextAlign.center,
              controller: controller,
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 110),
              ),
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
