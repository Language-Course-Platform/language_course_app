import 'package:flutter/material.dart';
import 'package:language_call_app/web/ui/widgets/web_app_bar.dart';
import 'package:language_call_app/web/ui/widgets/web_drawer.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({Key? key}) : super(key: key);

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  List<String> headersTitle = ["title1", "title2", "title3"];
  int selectedIndex = 0;
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
        //color: Colors.red,
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
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Row(
                    children: headersTitle
                        .map(
                          (e) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = headersTitle.indexOf(e);
                                    });
                                  },
                                  child: Text(
                                    e.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible:
                                    headersTitle.indexOf(e) == selectedIndex,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 400),
                                  opacity:
                                      headersTitle.indexOf(e) == selectedIndex
                                          ? 1
                                          : 0,
                                  child: Container(
                                    height: 5,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: const BoxDecoration(
                                      //color: Colors.blueGrey,
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    width: screenSize.width / 40,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: screenSize.height * 0.6,
                    //margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Progress",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 80),
                        child: const Text(
                          "History",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 50,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenSize.height * 0.6,
                          width: screenSize.width * 0.45,
                          //margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Flexible(
                          child: Container(
                            height: screenSize.height * 0.6,
                            width: screenSize.width * 0.45,
                            //margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.2,
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "© 2022 Fernando Fazio & Lucas Marinho.  All rights reserved",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
