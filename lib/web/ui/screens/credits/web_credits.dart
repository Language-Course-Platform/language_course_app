import 'package:flutter/material.dart';
import 'package:language_call_app/web/ui/widgets/web_app_bar.dart';

class WebCredits extends StatefulWidget {
  const WebCredits({Key? key}) : super(key: key);

  @override
  State<WebCredits> createState() => _WebCreditsState();
}

class _WebCreditsState extends State<WebCredits> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A40),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: WebAppBar(
          globalKey: globalKey,
        ),
      ),
    );
  }
}
