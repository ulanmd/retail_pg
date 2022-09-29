import 'package:awesome_calendar/awesome_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:retail_pg/evrika_colors.dart';
import 'package:retail_pg/widgets/range_calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(height: 70,),
        Container(
          width: 230,
          child: GestureDetector(
            onTap: () async {
              _showDevelopingDialog(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15 / 2,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/img/calendar.svg"),
                  const SizedBox(width: 10),
                  Text(DateFormat('dd.MM.yyyy').format(DateTime.now())),
                 Text(' - '),
                  Text(DateFormat('dd.MM.yyyy').format(DateTime.now())),
                ],
              ),
            ),
          )
        )
      ]),
    );
  }
}

Future _showDevelopingDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: EvrikaColors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, child: Text('Выбрать период'))),
              RangeCalendar(),
            ],
          ),
        ),
      ),
    ),
  );
}
