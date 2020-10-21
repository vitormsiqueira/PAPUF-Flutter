import 'package:flutter/material.dart';

textAppBar(String txt, {bool color = true}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Text(
      txt,
      style: TextStyle(
        color: color ? Colors.black : Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
