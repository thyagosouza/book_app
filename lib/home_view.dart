// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_app/widgets/bottom_navy_bar_widget.dart/bottom_navy_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'pages/animated_pages.dart';
import 'book.dart';
import 'share/book_details.dart';
import 'share/image_slider.dart';
import 'widgets/bottom_navy_bar_widget.dart/book_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  List<Book> books = [];
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    books = rawData
        .map(
          (data) => Book(
            title: data["title"],
            index: data["index"],
            image: data["image"],
            backgroundColor: data["backgroundColor"],
          ),
        )
        .toList();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = _pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final reversedBookList = books.reversed.toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Stack(
              children: reversedBookList.map((book) {
                return ImageSlider(
                  pageValue: pageValue,
                  image: book.image,
                  index: book.index - 1,
                  bakcgroundColor: book.backgroundColor,
                );
              }).toList(),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 0]),
              ),
            ),
            AnimatedPages(
              pageValue: pageValue,
              pageController: _pageController,
              pageCount: books.length,
              onPageChangeCallback: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              child: (index, _) => BookDetails(
                books[index],
              ),
            ),
            const Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: BottomNavyBarWidget(),
            ),
            Positioned(
              top: 50,
              right: 30,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Listening Now",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black87,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
