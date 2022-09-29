import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../evrika_colors.dart';
import 'greyLabelWidget.dart';

class AddressBottomModal extends StatelessWidget {
  const AddressBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Заполнение данных', style: TextStyle(
                      color: EvrikaColors.darkColor,
                      fontSize: 20
                  ),
                  ),
                  TextButton(
                      onPressed: ()=>Navigator.pop(context),
                      child: SvgPicture.asset('assets/img/close.svg'))
                ],
              ),
                Column(
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Image.asset('assets/img/iphone.png'),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'iPhone 13 Pro Max Blue 256Gb',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              '900 000₸',
                              style:
                              TextStyle(fontSize: 15, color: EvrikaColors.mainOrange),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    GreyLabel(text: 'Контакт №1:'),
                    SizedBox(height: 10,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Заполните поле...',
                      ),
                    ),
                    SizedBox(height: 10,),
                    GreyLabel(text: 'Контакт №2:'),
                    SizedBox(height: 10,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Заполните поле...',
                      ),
                    ),
                    SizedBox(height: 10,),
                    GreyLabel(text: 'Улица:'),
                    SizedBox(height: 10,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Заполните поле...',
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                GreyLabel(text: 'Дом:'),
                                SizedBox(height: 10,),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Дом...',
                                  ),
                                ),
                                SizedBox(height: 10,),
                                GreyLabel(text: 'Подъезд:'),
                                SizedBox(height: 10,),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Подъезд...',
                                  ),
                                ),
                              ],
                            ),),
                        SizedBox(width: 20,),
                        Expanded(flex: 1,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                GreyLabel(text: 'Этаж:'),
                                SizedBox(height: 10,),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Этаж...',
                                  ),
                                ),
                                SizedBox(height: 10,),
                                GreyLabel(text: 'Квартира:'),
                                SizedBox(height: 10,),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Квартира...',
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
