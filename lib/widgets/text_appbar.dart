import 'package:flutter/material.dart';

textAppBar(String txt, {bool isDark = true}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Text(
      txt,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
