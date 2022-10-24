// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'image_clipper.dart';

class ImageSlider extends StatelessWidget {
  final int index;
  final String image;
  final double pageValue;
  final Color bakcgroundColor;

  const ImageSlider({
    Key? key,
    required this.index,
    required this.image,
    required this.pageValue,
    required this.bakcgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageClipper(progress: getProgress()),
      child: Container(
        color: bakcgroundColor,
      ),
    );
  }

  double getProgress() {
    if (index == pageValue.floor()) {
      return 1.0 - (pageValue - index);
    } else if (index < pageValue.floor()) {
      return 0.0;
    } else {
      return 1.0;
    }
  }
}
