import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pfa/page/add%20events/addPage.dart';
import 'package:pfa/page/event%20list/widgets/event_tile.dart';
import 'package:pfa/page/event%20list/widgets/calendar_tile.dart';
import 'package:pfa/widgets/custom_appbar.dart';
import 'package:pfa/widgets/progress_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../services/firebase_crud.dart';
import 'widgets/no_data_found_widget.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  /// used for store user's selected date
  String selectedDate = "";

  /// used for highlite current date
  DateTime focusDate = DateTime.now();

  /// used for change calendar format, like week to month.
  CalendarFormat _calendarFormat = CalendarFormat.week;

  /// used for show loader while data are fetching
  bool isShowLoader = false;

  @override
  void initState() {
    var dateTime = DateTime.now();
    selectedDate = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
            appBarTitle: "List of Events", isLeadingIcon: true),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddPage(selectedDate: selectedDate))),
                child: const Text("Add New Event",
                    style: TextStyle(color: Colors.black)))),
        body: ProgressWidget(
            isShow: isShowLoader,
            child: Column(children: [
              /// used for show calendar
              CalendarTile(
                  callback: (selectedDay) async {
                    setState(() => isShowLoader = true);
                    String date =
                        "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}";
                    selectedDate = date;
                    focusDate = selectedDay;
                    Future.delayed(const Duration(milliseconds: 400),
                        () => setState(() => isShowLoader = false));
                  },
                  focusDate: focusDate,
                  calendarFormat: _calendarFormat,
                  calenderFormatCallback: (format) =>
                      setState(() => _calendarFormat = format)),

              /// read data from database and showing
              StreamBuilder(
                  stream: FirebaseCrud.readEvent(selectedDate.toString()),
                  builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) =>
                      snapshot.hasData
                          ? snapshot.data!.docs.isNotEmpty
                              ? Expanded(
                                  child: ListView(
                                      shrinkWrap: true,
                                      children: snapshot.data!.docs.map((e) {
                                        return EventTile(
                                            focusDate: focusDate, element: e);
                                      }).toList()))
                              : const NoDataFoundWidget()
                          : const NoDataFoundWidget())
            ])));
  }
}
