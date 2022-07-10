import 'package:flutter/material.dart';

class WebLearn extends StatefulWidget {
  const WebLearn({Key? key}) : super(key: key);

  @override
  State<WebLearn> createState() => _WebLearnState();
}

class _WebLearnState extends State<WebLearn> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
      ),
    );
  }
}
