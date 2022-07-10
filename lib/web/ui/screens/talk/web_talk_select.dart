import 'package:flutter/material.dart';

class WebTalkSelect extends StatefulWidget {
  const WebTalkSelect({Key? key}) : super(key: key);

  @override
  State<WebTalkSelect> createState() => _WebTalkSelectState();
}

class _WebTalkSelectState extends State<WebTalkSelect> {
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
