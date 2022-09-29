import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../evrika_colors.dart';
import 'addressBottomModal.dart';
import 'greyLabelWidget.dart';

class OrderFirstStep extends StatefulWidget {
  const OrderFirstStep({Key? key}) : super(key: key);

  @override
  State<OrderFirstStep> createState() => _OrderFirstStepState();
}

class _OrderFirstStepState extends State<OrderFirstStep> {
  String dropdownValue = 'Новое';
  bool check1 = false;
  bool check2 = false;

  int _selectedValue = 1;

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 1),
                children: const [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  Text('5'),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedValue = value+1;
                  });
                },
              ),
            ));
  }

  void _showBottomAddressFrom(){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5))
        ),
        builder: (context)=>const AddressBottomModal());
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: EvrikaColors.borderGreyColor, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
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
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const GreyLabel(text: 'Склад:'),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: EvrikaColors.boxShadowColor, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: DropdownButton<String>(
                  hint: const Text("Выберите склад..."),
                  isExpanded: true,
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: EvrikaColors.kPrimaryColor,
                    size: 26,
                  ),
                  style: const TextStyle(color: EvrikaColors.greyText),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Sever', 'Jangeldina', 'Al-Farabi', 'More..']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const GreyLabel(text: 'Качество:'),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: EvrikaColors.boxShadowColor, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: EvrikaColors.kPrimaryColor,
                              size: 26,
                            ),
                            style:
                                const TextStyle(color: EvrikaColors.greyText),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Новое',
                              'Jangeldina',
                              'Al-Farabi',
                              'More..'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        GreyLabel(text: 'Количество:'),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: EvrikaColors.boxShadowColor, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          child: Column(
                            children: [
                              OutlinedButton(
                                child: Text(
                                    '$_selectedValue'),
                                onPressed: () => _showPicker(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: EvrikaColors.boxShadowColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: EvrikaColors.kPrimaryColor,
                              focusColor: EvrikaColors.kPrimaryColor,
                              value: check1,
                              onChanged: (bool? value) {
                                setState(() {
                                  check1 = value!;
                                  if(check1) _showBottomAddressFrom();
                                });
                              }),
                          Text(
                            'С доставкой',
                            style: TextStyle(
                                fontSize: 15, color: EvrikaColors.darkColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: EvrikaColors.boxShadowColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: EvrikaColors.kPrimaryColor,
                              focusColor: EvrikaColors.kPrimaryColor,
                              value: check2,
                              onChanged: (bool? value) {
                                setState(() {
                                  check2 = value!;
                                });
                              }),
                          const Text(
                            'С установкой',
                            style: TextStyle(
                                fontSize: 15, color: EvrikaColors.darkColor),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
