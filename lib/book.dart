// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Book {
  final String title;
  final String image;
  // final String pdfImage;
  final int index;
  final Color backgroundColor;

  Book({
    required this.title,
    required this.image,
    //  required this.pdfImage,
    required this.index,
    required this.backgroundColor,
  });
}

List<Map<String, dynamic>> rawData = [
  {
    'title': 'Where I End and You Begin',
    'image': 'assets/books/book_where_i_end_and_you_begin.jpg',
    // 'pdfImage': 'assets/pdf_image.png',
    'backgroundColor': Color(0xFF0eb2ab),
    'index': 1,
  },
  {
    'title': 'The Bees',
    'image': 'assets/books/book_the_bees.jpg',
    // 'pdfImage': 'assets/pdf_image.png',
    'backgroundColor': Colors.yellowAccent,
    'index': 2,
  },
  {
    'title': 'Finding Me: A Memoir',
    'image': 'assets/books/book_finding_me_a_memoir.jpg',
    // 'pdfImage': 'assets/pdf_image.png',
    'backgroundColor': Color(0xFFB6B3B3),
    'index': 3,
  },
  {
    'title': 'The Hotel Nantucket',
    'image': 'assets/books/the_hotel_nantucket.jpg',
    //  'pdfImage': 'assets/pdf_image.png',
    'backgroundColor': Colors.blueAccent,
    'index': 4,
  },
  {
    'title': 'Skandar ',
    'image': 'assets/books/book_skandar.jpg',
    // 'pdfImage': 'assets/pdf_image.png',
    'backgroundColor': Colors.redAccent,
    'index': 5,
  },
];
