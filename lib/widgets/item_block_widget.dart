
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../evrika_colors.dart';
import 'greyLabelWidget.dart';

class ItemBlockWidget extends StatelessWidget {
  const ItemBlockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: EvrikaColors.boxShadowColor, width: 2),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/iphone.png',
                width: 85,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'iPhone 13 Pro Max Blue 256GB',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/img/installation.svg',
                          width: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          'assets/img/delivery.svg',
                          width: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Склад:'),
                            Text('На Севере',
                            style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Качество:'),
                            Text('Новое',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          DottedLine(
            dashColor: EvrikaColors.borderGreyColor,
            lineThickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/img/delete.svg',
                  width: 15,
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  'assets/img/edit.svg',
                  width: 18,
                ),
                Spacer(),
                Text('2 шт'),
                SizedBox(width: 10,),
                Text('x'),
                SizedBox(width: 10,),
                Text(
                  '100 000₸',
                  style:
                      TextStyle(fontSize: 14, color: EvrikaColors.mainOrange),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
