import 'package:flutter/material.dart';

class WebTalk extends StatefulWidget {
  const WebTalk({Key? key}) : super(key: key);

  @override
  State<WebTalk> createState() => _WebTalkState();
}

class _WebTalkState extends State<WebTalk> {
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
