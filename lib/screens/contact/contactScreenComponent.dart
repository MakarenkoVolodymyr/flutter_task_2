import 'package:flutter/material.dart';

Widget buildTextField(TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
  );
}

Widget buildText(String str) {
  return Padding(
    padding: const EdgeInsets.only(top: 40, bottom: 5),
    child: Text(
      str,
      textAlign: TextAlign.left,
      style: TextStyle(),
    ),
  );
}