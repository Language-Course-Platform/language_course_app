import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:language_call_app/web/ui/widgets/web_app_bar.dart';

class WebBilling extends StatefulWidget {
  const WebBilling({Key? key}) : super(key: key);

  @override
  State<WebBilling> createState() => _WebBillingState();
}

class _WebBillingState extends State<WebBilling> {
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
