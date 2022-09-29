import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnalogClock(
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black),
            color: Colors.transparent,
            shape: BoxShape.circle),
        width: 150.0,
        isLive: true,
        hourHandColor: Colors.black,
        minuteHandColor: Colors.black,
        showSecondHand: true,
        numberColor: Colors.black87,
        showNumbers: true,
        textScaleFactor: 1.4,
        showTicks: true,
        showDigitalClock: true,
        datetime: DateTime.now(),
        key: const GlobalObjectKey(3),
      ),
    );
  }
}
