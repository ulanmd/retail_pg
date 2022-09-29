
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../evrika_colors.dart';

class RangeCalendar extends StatelessWidget {
  const RangeCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: SfDateRangePicker(
        initialDisplayDate: DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionMode: DateRangePickerSelectionMode.range,
        todayHighlightColor: EvrikaColors.kPrimaryColor,
        rangeSelectionColor: EvrikaColors.lightBlueColor,
        selectionColor: EvrikaColors.kPrimaryColor,
        startRangeSelectionColor: EvrikaColors.kPrimaryColor,
        endRangeSelectionColor: EvrikaColors.kPrimaryColor,
        selectionTextStyle: TextStyle(color: EvrikaColors.white),
        rangeTextStyle: TextStyle(color: EvrikaColors.kPrimaryColor),
        maxDate: DateTime.now(),
        selectionShape: DateRangePickerSelectionShape.rectangle,
        monthViewSettings: DateRangePickerMonthViewSettings(),
      ),
    );
  }
}
