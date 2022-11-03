import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfa/comman/constants/theme_colors.dart';

class ProgressWidget extends StatelessWidget {
  final Widget child;
  final bool isShow;
  final double opacity;
  final Color color;

  const ProgressWidget({
    Key? key,
    required this.child,
    this.isShow = true,
    this.opacity = 0.3,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (isShow) {
      final modal = Stack(children: [
        Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color)),
        Center(
            child: Platform.isAndroid
                ? const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ThemeColors.primaryColor))
                : const CupertinoActivityIndicator(animating: true))
      ]);
      widgetList.add(modal);
    }
    return Stack(children: widgetList);
  }
}
