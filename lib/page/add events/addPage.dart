import 'package:flutter/material.dart';
import 'package:pfa/widgets/custom_appbar.dart';
import 'package:pfa/widgets/custom_btn.dart';
import 'package:pfa/widgets/name_field.dart';
import 'package:pfa/widgets/snack_bar.dart';
import '../../services/firebase_crud.dart';

class AddPage extends StatefulWidget {
  final String selectedDate;

  const AddPage({super.key, required this.selectedDate});

  @override
  State<StatefulWidget> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  /// Called whenever user type any text
  final eventName = TextEditingController();

  /// used for validate textfield.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          const CustomAppBar(appBarTitle: "Add New Event", isLeadingIcon: true),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                      const SizedBox(height: 75.0),
                      CustomBtn(btnName: "Save", callback: () => addEvent()),
                      const SizedBox(height: 15.0)
                    ])))
      ]));

  /// used for add event name in firebase database
  addEvent() async {
    if (_formKey.currentState!.validate()) {
      var response = await FirebaseCrud.addEvent(
          name: eventName.text, date: widget.selectedDate);
      if (response.code != 200) {
        SnackBarWidget.show(context, response.message.toString());
      } else {
        Navigator.pop(context);
        SnackBarWidget.show(context, response.message.toString());
      }
    }
  }
}
