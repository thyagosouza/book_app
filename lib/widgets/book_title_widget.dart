// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../book.dart';

class BookTitleWidget extends StatelessWidget {
  final String title;
  const BookTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Chapter 1 - 12:44 ",
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
