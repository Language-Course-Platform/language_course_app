import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class WebDrawer extends StatefulWidget {
  const WebDrawer({Key? key}) : super(key: key);

  @override
  State<WebDrawer> createState() => _WebDrawerState();
}

class _WebDrawerState extends State<WebDrawer> {
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: const Color(0xff1A1A40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ListView(
              controller: scrollController,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  // decoration: const BoxDecoration(
                  //   color: Colors.transparent,
                  // ),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: Image.asset(
                                "./assets/avatar.png",
                              ).image,
                              radius: 20,
                              backgroundColor: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Fernando Sinigaglia",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                    leading: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    horizontalTitleGap: 0,
                    title: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => QR.toName("ProfileEdit", params: {})),
                ListTile(
                  leading: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 0,
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 0,
                  title: const Text(
                    'Billing',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.attach_money_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 0,
                  title: const Text(
                    'Your Credits',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            horizontalTitleGap: 0,
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
