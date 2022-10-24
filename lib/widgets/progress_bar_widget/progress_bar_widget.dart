import 'package:flutter/material.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';
import 'dart:math' as math;

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        transform: Matrix4.rotationX(math.pi),
        child: MultiCircularSlider(
          progressBarType: MultiCircularSliderType.circular,
          size: MediaQuery.of(context).size.width * 1,
          values: const [0.60],
          colors: const [
            Color.fromARGB(255, 32, 12, 18),
          ],
          //showTotalPercentage: true,
          // label: 'This is label text',

          animationDuration: const Duration(milliseconds: 500),
          animationCurve: Curves.easeIn,
          innerIcon: const Icon(Icons.integration_instructions),
          //innerWidget: const Text('96%'),

          trackColor: Colors.grey.withOpacity(0.3),
          progressBarWidth: 20.0,
          trackWidth: 5.0,
          labelTextStyle: const TextStyle(),
          percentageTextStyle: const TextStyle(),
        ),
      ),
    );
  }
}
