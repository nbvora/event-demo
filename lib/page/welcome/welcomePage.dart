import 'package:flutter/material.dart';
import 'package:pfa/comman/constants/asset_images.dart';
import 'package:pfa/comman/styles/custom_text_style.dart';
import 'package:pfa/page/event%20list/listPage.dart';
import 'package:pfa/widgets/custom_appbar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _EventWelcomePageState();
}

class _EventWelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(appBarTitle: "Welcome"),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(LocalImages.flutterLogo),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListPage())),
                      child: Text("Go To Event List",
                          style: CustomTextStyle.getTitleStyle()))
                ])));
  }
}
