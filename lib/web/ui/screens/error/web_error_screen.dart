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
      //backgroundColor: const Color(0xff1A1A40),
      endDrawer: const WebDrawer(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: WebAppBar(
          globalKey: globalKey,
        ),
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          //color: Color(0xff1A1A40),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 1],
            colors: [
              Color(0xff1a1a40),
              Colors.teal,
            ],
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "./assets/error.png",
                  height: 500,
                  width: 500,
                ),
                const Text(
                  "Not Found!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
