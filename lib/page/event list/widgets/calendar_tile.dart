import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

typedef DateToVoidFunc = void Function(DateTime selectedDay);
typedef CalenderFormatToVoidFunc = void Function(CalendarFormat format);

class CalendarTile extends StatelessWidget {
  final DateToVoidFunc callback;
  final DateTime focusDate;
  final CalendarFormat calendarFormat;
  final CalenderFormatToVoidFunc calenderFormatCallback;

  const CalendarTile(
      {Key? key,
      required this.callback,
      required this.focusDate,
      required this.calendarFormat,
      required this.calenderFormatCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(children: [
        Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: TableCalendar(
                locale: 'en_US',
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) =>
                    callback.call(selectedDay),
                headerVisible: true,
                headerStyle: const HeaderStyle(
                    decoration: BoxDecoration(),
                    leftChevronIcon: Icon(Icons.arrow_back_ios_sharp,
                        size: 15, color: Colors.black),
                    rightChevronIcon: Icon(Icons.arrow_forward_ios_sharp,
                        size: 15, color: Colors.black),
                    titleCentered: true,
                    headerPadding: EdgeInsets.only(top: 12, bottom: 20),
                    leftChevronPadding: EdgeInsets.only(left: 10),
                    rightChevronPadding: EdgeInsets.only(right: 10),
                    titleTextStyle:
                        TextStyle(color: Colors.black, fontSize: 17),
                    formatButtonVisible: false,
                    formatButtonTextStyle: TextStyle(color: Colors.black)),
                calendarFormat: calendarFormat,
                calendarStyle: const CalendarStyle(outsideDaysVisible: false),
                onFormatChanged: (format) {
                  if (calendarFormat != format) {
                    calenderFormatCallback.call(format);
                  }
                },
                currentDay: focusDate,
                focusedDay: focusDate,
                firstDay: DateTime.now().subtract(const Duration(days: 1200)),
                lastDay: DateTime.now().add(const Duration(days: 500)))),
        Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 2.2,
            right: MediaQuery.of(context).size.width / 2.2,
            child: Container(
                height: 8,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8))))
      ]);
}
