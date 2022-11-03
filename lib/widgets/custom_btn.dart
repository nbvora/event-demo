import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback callback;
  final String btnName;

  const CustomBtn({Key? key, required this.callback, required this.btnName})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(12.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async => callback.call(),
          child: Text(btnName,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center)));
}
