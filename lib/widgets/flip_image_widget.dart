// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flip_widget/flip_widget.dart';
import 'package:flutter/material.dart';

import '../book.dart';
import '../pages/pdf_page.dart';

class FlipImageWidget extends StatefulWidget {
  final String imageCapa;

  //final Book book;
  //final int pdfNumber;
  FlipImageWidget({
    // this.book,
    Key? key,
    required this.imageCapa,
  }) : super(key: key);

  @override
  State<FlipImageWidget> createState() => _FlipImageWidgetState();
}

const double _MinNumber = 0.008;
double _clampMin(double v) {
  if (v < _MinNumber && v > -_MinNumber) {
    if (v >= 0) {
      v = _MinNumber;
    } else {
      v = -_MinNumber;
    }
  }
  return v;
}

class _FlipImageWidgetState extends State<FlipImageWidget> {
  GlobalKey<FlipWidgetState> _flipKey = GlobalKey();

  Offset _oldPosition = Offset.zero;
  bool _visible = true;

  @override
  void initState() {
    var imageCapa;
    var pdfImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(270, 320);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              // // child: PdfPage(),
              color: Colors.black,
              // child: ClipRRect(
              //   child: Image.asset(
              //     widget.pdfImage,
              //     width: MediaQuery.of(context).size.width,
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            Container(
              width: size.width,
              height: size.height,
              child: GestureDetector(
                child: FlipWidget(
                  key: _flipKey,
                  textureSize: size * 2,
                  child: ClipRRect(
                    child: Image.asset(
                      widget.imageCapa,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // leftToRight: true,
                ),
                onHorizontalDragStart: (details) {
                  _oldPosition = details.globalPosition;
                  _flipKey.currentState?.startFlip();
                },
                onHorizontalDragUpdate: (details) {
                  Offset off = details.globalPosition - _oldPosition;
                  double tilt = 1 / _clampMin((-off.dy + 20) / 100);
                  double percent = math.max(0, -off.dx / size.width * 1.4);
                  percent = percent - percent / 2 * (1 - 1 / tilt);
                  _flipKey.currentState?.flip(percent, tilt);
                },
                onHorizontalDragEnd: (details) {
                  _flipKey.currentState?.stopFlip();
                },
                onHorizontalDragCancel: () {
                  _flipKey.currentState?.stopFlip();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
