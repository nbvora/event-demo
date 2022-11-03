import 'package:flutter/material.dart';
import 'package:pfa/widgets/custom_appbar.dart';
import 'package:pfa/widgets/custom_btn.dart';
import 'package:pfa/widgets/name_field.dart';
import 'package:pfa/widgets/snack_bar.dart';
import '../../models/events.dart';
import '../../services/firebase_crud.dart';

class EditPage extends StatefulWidget {
  final Event? event;

  const EditPage({super.key, this.event});

  @override
  State<StatefulWidget> createState() => _EditPage();
}

class _EditPage extends State<EditPage> {
  /// Called whenever user type any text
  final eventName = TextEditingController();

  /// Used for assign docID for update events
  final docId = TextEditingController();

  /// used for validate textfield.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    /// Used for assign docID and event name
    /// Use  for auto fill textfield
    docId.value = TextEditingValue(text: widget.event!.uid.toString());
    eventName.value =
        TextEditingValue(text: widget.event!.eventName.toString());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          const CustomAppBar(appBarTitle: "Edit Event", isLeadingIcon: true),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 45.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Name: "),
                            const SizedBox(width: 20.0),
                            Expanded(child: NameField(controller: eventName))
                          ]),
                      const SizedBox(height: 45.0),
                      CustomBtn(
                          btnName: "Update", callback: () => updateEvents()),
                      const SizedBox(height: 15.0)
                    ])))
      ]));

  /// used for update event name in firebase database
  updateEvents() async {
    if (_formKey.currentState!.validate()) {
      var response = await FirebaseCrud.updateEvent(
          name: eventName.text,
          date: widget.event!.date.toString(),
          docId: docId.text);
      if (response.code != 200) {
        SnackBarWidget.show(context, response.message.toString());
      } else {
        Navigator.pop(context);
        SnackBarWidget.show(context, response.message.toString());
      }
    }
  }
}
