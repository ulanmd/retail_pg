import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

import '../evrika_colors.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
              decoration: BoxDecoration(
                border:
                    Border.all(color: EvrikaColors.borderGreyColor, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Palenshe Tugensheuly'),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset('assets/img/User.png')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('Магазин: на Севере'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: EvrikaColors.borderGreyColor, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: AnalogClock(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  width: 150.0,
                  isLive: true,
                  hourHandColor: Colors.black,
                  minuteHandColor: Colors.black,
                  showSecondHand: false,
                  numberColor: Colors.black87,
                  showNumbers: true,
                  showAllNumbers: false,
                  textScaleFactor: 1.4,
                  showTicks: false,
                  showDigitalClock: false,
                )),
          )
        ],
      ),
    ));
  }
}
