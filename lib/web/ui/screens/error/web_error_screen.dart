import 'package:flutter/material.dart';
import 'package:language_call_app/web/ui/widgets/web_app_bar.dart';
import 'package:language_call_app/web/ui/widgets/web_drawer.dart';

class WebErrorScreen extends StatefulWidget {
  const WebErrorScreen({Key? key}) : super(key: key);

  @override
  State<WebErrorScreen> createState() => _WebErrorScreenState();
}

class _WebErrorScreenState extends State<WebErrorScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      backgroundColor: const Color(0xff1A1A40),
      endDrawer: const WebDrawer(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: WebAppBar(
          globalKey: globalKey,
        ),
      ),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: ListView(
          children: [
            SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: const Text(
                "error",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
