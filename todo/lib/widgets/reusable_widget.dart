import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../Cubit_services/cubit.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  required GestureTapCallback onTap,
}) =>
    TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter task name';
        }
        return null;
      },
      onTap: onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: Icon(icon),
        labelText: labelText,
      ),
    );

Widget buildListUi(context,
    {required List<Map> tasks, required String type}) {
  String emptyMessage;

  switch (type) {
    case 'home':
      emptyMessage = 'no tasks here';
      break;
    case 'archive':
      emptyMessage = 'no tasks here';
      break;
    case 'done':
      emptyMessage = 'no tasks here';
      break;
    default:
      emptyMessage = 'no data';
  }

  var cubit = AppCubit.get(context);

  return Container(
    width: MediaQuery.of(context).size.width * .95,
    height: MediaQuery.of(context).size.height * .778,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey,
    ),
    child: ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (BuildContext context) => ListView.separated(
        itemBuilder: (context, index) => listItem(
          model: tasks[index],
          donePressed: () {
            if (tasks[index]['status'] == 'done') {
              cubit.updateDatabase('status', tasks[index]['id']);
            } else {
              cubit.updateDatabase('done', tasks[index]['id']);
            }
          },
          deletePressed: () {
            cubit.deleteFromDatabase(tasks[index]['id']);
          },
          archivePressed: () {
            if (tasks[index]['status'] == 'archive') {
              cubit.updateDatabase('status', tasks[index]['id']);
            } else {
              cubit.updateDatabase('archive', tasks[index]['id']);
            }
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: tasks.length,
      ),
      fallback: (BuildContext context) => Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}

Widget listItem({
  required VoidCallback donePressed,
  required VoidCallback deletePressed,
  required VoidCallback archivePressed,
  required Map model,
}) {
  return Card(
    elevation: 5,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Container(
      decoration: BoxDecoration(
        color: model['status'] == 'done'
            ? const Color.fromARGB(94, 48, 52, 54)
            : model['status'] == 'archive'
                ? const Color.fromARGB(147, 47, 47, 48)
                : Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: donePressed,
                icon: Icon(
                  model['status'] == 'done'
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  model["title"],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: archivePressed,
                icon: Icon(
                  model['status'] == 'archive'
                      ? Icons.archive
                      : Icons.archive_outlined,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: deletePressed,
                icon: const Icon(Icons.delete, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 5),
                  Text(model["time"],
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18),
                  const SizedBox(width: 5),
                  Text(model["date"],
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

BottomBarItem bottomBarItem(
        {required IconData icon, required String text}) =>
    BottomBarItem(
      inActiveItem:
          Icon(icon, color: const Color.fromARGB(255, 16, 16, 17)),
      activeItem:
          Icon(icon, color: const Color.fromARGB(255, 215, 214, 219)),
      itemLabelWidget: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );