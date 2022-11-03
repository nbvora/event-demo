import 'package:flutter/material.dart';
import 'package:pfa/comman/styles/custom_text_style.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
      child: Center(
          child:
              Text("No Data Found", style: CustomTextStyle.getTitleStyle())));
}
