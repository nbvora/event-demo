import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitle;
  final bool isLeadingIcon;

  const CustomAppBar(
      {Key? key, required this.appBarTitle, this.isLeadingIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
      title: Text(appBarTitle),
      backgroundColor: Theme.of(context).primaryColor,
      leading: isLeadingIcon
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.keyboard_backspace, color: Colors.white))
          : null);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
