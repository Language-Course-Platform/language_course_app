import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../widgets/web_app_bar.dart';
import '../../widgets/web_drawer.dart';

class WebLanding extends StatefulWidget {
  const WebLanding({Key? key}) : super(key: key);

  @override
  State<WebLanding> createState() => _WebLandingState();
}

class _WebLandingState extends State<WebLanding> {
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
        preferredSize: const Size.fromHeight(60),
        child: WebAppBar(
          globalKey: globalKey,
        ),
      ),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            Container(
              height: screenSize.height,
              width: screenSize.width,
              //: const EdgeInsets.only(left: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("./assets/avatar.png").image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 50),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "A new way to learning a new language",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "A new way to learning a new language",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 55,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () => QR.to("/register"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Text(
                          "Get Started!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            /* Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                //color: Color(0xff1A1A40),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.5,
                    1,
                  ],
                  colors: [
                    Colors.teal,
                    Color(0xff1a1a40),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Text(
                        "A new way to learning a new language",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "A new way to learning a new language",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  /* SizedBox(
                    height: 200,
                    width: 150,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 1,
                    ),
                  ), */
                ],
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
