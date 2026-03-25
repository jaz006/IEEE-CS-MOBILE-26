import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

//bottom bar item
BottomBarItem bottomBarItem({required IconData icon, required String text}) =>
    BottomBarItem(
      inActiveItem: Icon(icon, color: Colors.white),
      activeItem: Icon(icon, color: Colors.blueAccent),
      itemLabelWidget: Text(text, style: TextStyle(color: Colors.white)),
    );

Widget defultFormField({
  required TextEditingController Controller,
  required String labelText,
  required IconData icon,
  required GestureTapCallback onTap
}) => TextFormField(
  controller: Controller,
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter ur password';
    }
    return null;
  },
  onTap: onTap,
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    labelText: labelText,
    prefixIcon: Icon(icon),
  ),
);
