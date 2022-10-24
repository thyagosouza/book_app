import 'package:flutter/material.dart';

import '../models/book_list_model.dart';

class BookList {
  int _bookNumber = 1;
  List<BookListModel> bookData = [
    BookListModel(
      //_bookNumber = 0
      title: 'Where I End and You Begin',
      image: 'assets/book_app/book_where_i_end_and_you_begin.jpg',
      backgroundColor: Color(0xFF0eb2ab),
      index: 1,
      id: 1,
    ),
    BookListModel(
      //_bookNumber = 1
      title: 'The Bees',
      image: 'assets/book_app/book_the_bees.jpg',
      backgroundColor: Colors.yellowAccent,
      index: 2,
      id: 2,
    ),
    BookListModel(
      //_bookNumber = 2
      title: 'Finding Me: A Memoir',
      image: 'assets/book_app/book_finding_me_a_memoir.jpg',
      backgroundColor: Colors.greenAccent,
      index: 3,
      id: 3,
    ),
    BookListModel(
      //_bookNumber = 3
      title: 'The Hotel Nantucket',
      image: 'assets/book_app/the_hotel_nantucket.jpg',
      backgroundColor: Colors.purpleAccent,
      index: 4,
      id: 4,
    ),
    BookListModel(
      //_bookNumber = 4
      title: 'Skandar ',
      image: 'assets/book_app/book_skandar.jpg',
      backgroundColor: Colors.blueAccent,
      index: 5,
      id: 5,
    ),
  ];

  int getBookNumber() {
    return bookData[_bookNumber].id;
  }

  String getTitle() {
    return bookData[_bookNumber].title;
  }

  int getIndex() {
    return bookData[_bookNumber].index;
  }
}
