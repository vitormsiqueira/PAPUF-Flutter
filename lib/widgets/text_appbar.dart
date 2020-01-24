import 'package:flutter/material.dart';

textAppBar(String txt) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Text(
      txt,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
