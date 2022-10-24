// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../book.dart';
import 'book_title_widget.dart';
import 'flip_image_widget.dart';
import 'player_widget.dart';
import 'progress_bar_widget/progress_bar_widget.dart';

class ContainerWidget extends StatelessWidget {
  final bool visible;
  final Color color;

  final String image;
  const ContainerWidget({
    Key? key,
    this.visible = true,
    required this.color,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 525,
          width: 320,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(28, 28),
                blurRadius: 30.0,
                color: Colors.black.withOpacity(
                  0.2,
                ),
              ),
            ],
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(200),
            ),
            color: color,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 15,
                left: 20,
                child: Container(
                  height: 335,
                  child: FlipImageWidget(
                    imageCapa: image,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 5),
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(
                          0.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          right: 30,
          left: 20,
          child: SizedBox(
            height: 80,
            width: 280,
            child: Visibility(
              visible: visible,
              child: ProgressBarWidget(),
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                child: Visibility(
                  visible: visible,
                  child: PlayerWidget(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
