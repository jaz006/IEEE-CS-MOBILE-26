import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({super.key, required this.formKey, required this.titleController, required this.timeController, required this.dateController});
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController timeController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your task name: ";
                }
                return null;
              },
              onTap: () {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                labelText: "Task Name",
                prefixIcon: const Icon(Icons.sticky_note_2),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: timeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your task time: ";
                }
                return null;
              },
              onTap: () {
                showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now())
                    .then((value) {
                  timeController.text = value!.format(context);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                labelText: "Task time",
                prefixIcon: const Icon(Icons.timelapse),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: dateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your task date: ";
                }
                return null;
              },
              onTap: () {
                showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    lastDate: DateTime.parse('3999-05-09'))
                    .then((value) {
                  dateController.text =
                      DateFormat.yMMMd().format(value!);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                labelText: "Task Date",
                prefixIcon: const Icon(Icons.calendar_month_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}