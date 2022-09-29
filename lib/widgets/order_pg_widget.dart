import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../evrika_colors.dart';
import '../store/orderStore.dart';
import 'extend_time_widget.dart';
import 'greyLabelWidget.dart';
import 'item_block_widget.dart';

class OrderPgWidget extends StatelessWidget {
  const OrderPgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Order order = Provider.of<Order>(context, listen: false);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Заявка №123',
                style:
                TextStyle(color: EvrikaColors.darkColor, fontSize: 23),),
              TextButton(
                  onPressed: () {
                    order.setFalse();
                    print(order.isOpen);
                  },
                  child: SvgPicture.asset('assets/img/close.svg', width: 10,),)
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExtendTimeWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  ItemBlockWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  ItemBlockWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: EvrikaColors.kPrimaryColor),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/img/plus.svg',
                            color: EvrikaColors.kPrimaryColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Добавить товар',
                            style: TextStyle(color: EvrikaColors.kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: EvrikaColors.boxShadowColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GreyLabel(text: 'ФИО клиента:'),
                            Text('Ержігіт Мысалов')
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GreyLabel(text: 'Cкидка:'),
                            Text('Отсутствует'),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GreyLabel(text: 'Бонусы:'),
                            Text('Отсутствует')
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DottedLine(
                          dashColor: EvrikaColors.borderGreyColor,
                          lineThickness: 2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Итоговая сумма:',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '100 000₸',
                              style: TextStyle(
                                  fontSize: 14, color: EvrikaColors.mainOrange),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
