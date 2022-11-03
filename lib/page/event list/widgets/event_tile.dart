import 'package:flutter/material.dart';
import 'package:pfa/comman/styles/custom_text_style.dart';
import 'package:pfa/models/events.dart';
import 'package:pfa/services/firebase_crud.dart';
import 'package:pfa/utils/date_utils.dart';
import 'package:pfa/widgets/snack_bar.dart';

import '../../edit events/editPage.dart';

class EventTile extends StatelessWidget {
  final dynamic element;
  final DateTime focusDate;

  const EventTile({Key? key, this.element, required this.focusDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 15),
      child: SizedBox(
          width: double.infinity,
          child: Stack(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                      width: 60,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(focusDate.day.toString(),
                                textAlign: TextAlign.start,
                                style: CustomTextStyle.getHeaderStyle(
                                    fontSize: 25)),
                            Text(DateUtil.getWeekNameString(focusDate.weekday),
                                textAlign: TextAlign.start,
                                style: CustomTextStyle.getTitleStyle())
                          ]))),
              const SizedBox(width: 5),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        Flexible(
                            child: Row(children: [
                          Expanded(
                              flex: 3,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(element['event_name'],
                                        maxLines: 1,
                                        style: CustomTextStyle.getTitleStyle()),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EditPage(
                                                    event: Event(
                                                        uid: element.id,
                                                        eventName: element[
                                                            "event_name"],
                                                        date:
                                                            element["date"])))),
                                        child: Text("Edit",
                                            maxLines: 1,
                                            style:
                                                CustomTextStyle.getTitleStyle(
                                                    Colors.blueAccent)))
                                  ])),
                          const SizedBox(height: 20),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("",
                                        maxLines: 1,
                                        style: CustomTextStyle.getTitleStyle()),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                        onTap: () async {
                                          var response =
                                              await FirebaseCrud.deleteEvent(
                                                  docId: element.id);
                                          if (response.code != 200) {
                                            SnackBarWidget.show(context,
                                                response.message.toString());
                                          } else {
                                            SnackBarWidget.show(context,
                                                response.message.toString());
                                          }
                                        },
                                        child: Text("Remove",
                                            maxLines: 1,
                                            style:
                                                CustomTextStyle.getTitleStyle(
                                                    Colors.red)))
                                  ]))
                        ]))
                      ])))
            ])
          ])));
}
