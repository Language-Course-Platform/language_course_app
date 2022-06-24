import 'package:flutter/material.dart';

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
    );
  }
}
