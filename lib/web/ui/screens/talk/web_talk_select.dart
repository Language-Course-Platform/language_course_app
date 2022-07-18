import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class WebTalkSelect extends StatefulWidget {
  const WebTalkSelect({Key? key}) : super(key: key);

  @override
  State<WebTalkSelect> createState() => _WebTalkSelectState();
}

class _WebTalkSelectState extends State<WebTalkSelect> {
  List<FlagsCode> flagList = FlagsCode.values.toList();
  PageController? pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
            /* Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Flag.fromCode(
                FlagsCode.BR,
                borderRadius: 100,
              ),
            ), */

            Container(
              height: screenSize.height,
              width: screenSize.width,
              child: GridView.extent(
                shrinkWrap: true,
                maxCrossAxisExtent: flagList.length.toDouble() ?? 0,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                children: flagList
                    .where((element) => element.index != 0)
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Flag.fromCode(
                            e,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
