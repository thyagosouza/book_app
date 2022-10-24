import 'package:flutter/material.dart';

class BookListModel {
  final String title;
  final String image;
  final int index;
  final Color backgroundColor;
  final int id;

  BookListModel({
    required this.title,
    required this.image,
    required this.index,
    required this.backgroundColor,
    required this.id,
  });
}
