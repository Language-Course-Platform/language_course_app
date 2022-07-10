import 'package:flutter/material.dart';

class WebLearnById extends StatefulWidget {
  const WebLearnById({Key? key}) : super(key: key);

  @override
  State<WebLearnById> createState() => _WebLearnByIdState();
}

class _WebLearnByIdState extends State<WebLearnById> {
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
