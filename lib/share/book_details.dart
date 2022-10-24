import 'package:flutter/material.dart';

import '../book.dart';
import '../widgets/book_title_widget.dart';
import '../widgets/container_widget.dart';

import 'book_list.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails(this.book, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 110,
          right: 0,
          left: 0,
          child: ContainerWidget(
            color: Colors.white,
            image: book.image,
          ),
        ),
        Positioned(
          bottom: 240,
          right: 0,
          left: -15,
          child: BookTitleWidget(
            title: book.title,
          ),
        )
      ],
    );
  }
}
