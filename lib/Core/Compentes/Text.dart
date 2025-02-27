import 'package:flutter/material.dart';

Widget H1(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
  );
}

Widget H2(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
  );
}

Widget H3(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
  );
}

Widget h1(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.black, fontSize: 24),
  );
}

Widget h2(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.black, fontSize: 18),
  );
}

Widget h3(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.black, fontSize: 12),
  );
}
