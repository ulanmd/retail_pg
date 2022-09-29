import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../evrika_colors.dart';
import '../store/orderStore.dart';
import 'labelStackWidget.dart';

class ProposalItemWidget extends StatelessWidget {
  const ProposalItemWidget(
      {Key? key, required this.type, required this.color, required this.text})
      : super(key: key);

  final String? type;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    Order order = Provider.of<Order>(context, listen: false);
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          order.setTrue();
          print(order.isOpen);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/img/Icon.png',
                        width: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Заявка №123',
                          style: TextStyle(
                              fontSize: 15, color: EvrikaColors.darkColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Количество продаж',
                            style: TextStyle(
                                fontSize: 10, color: EvrikaColors.greyText),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                                fontSize: 12, color: EvrikaColors.darkColor),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Итоговая сумма:',
                            style: TextStyle(
                                fontSize: 10, color: EvrikaColors.greyText),
                          ),
                          Text(
                            '5 000 000 ₸',
                            style: TextStyle(
                                fontSize: 12, color: EvrikaColors.mainOrange),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 15,
                right: -5,
                child: LabelStackWidget(
                  type: type,
                  color: color,
                  text: text,
                )),
          ],
        ),
      ),
    );
  }
}
