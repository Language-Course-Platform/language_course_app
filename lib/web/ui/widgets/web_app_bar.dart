import 'package:flutter/material.dart';
import 'package:language_call_app/web/repository/user_repository.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../models/user.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({Key? key, required this.globalKey}) : super(key: key);
  final GlobalKey<ScaffoldState> globalKey;

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  bool? isCreditHovered = false;
  UserRepository userRepository = UserRepository();
  User? user;
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      userRepository.read().then((value) => setState(() {
            user = value;
          }));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xff1A1A40),
      elevation: 0,
      toolbarHeight: 70,
      title: user == null
          ? null
          : Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () => QR.to("/"),
                  child: const Center(
                    child: Text(
                      "Learn",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => QR.to("/"),
                  child: const Center(
                    child: Text(
                      "Talk",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      leadingWidth: 100,
      leading: Row(
        children: [
          const SizedBox(
            width: 40,
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => QR.to("/"),
            child: const Center(
              child: Text(
                "Logo",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: user == null
          ? [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child: InkWell(
                  onTap: () {
                    QR.navigator.push("/register");
                  },
                  child: const Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: InkWell(
                  onTap: () {
                    QR.navigator.push("/login");
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ]
          : [
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onHover: (value) => setState(() {
                    isCreditHovered = value;
                  }),
                  onTap: () {},
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    children: [
                      Icon(
                        Icons.attach_money_outlined,
                        color: isCreditHovered != null && isCreditHovered!
                            ? Colors.yellow
                            : Colors.white,
                      ),
                      Text(
                        '0,00',
                        style: TextStyle(
                          fontSize: 20,
                          color: isCreditHovered != null && isCreditHovered!
                              ? Colors.yellow
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () => widget.globalKey.currentState?.openEndDrawer(),
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
              const SizedBox(
                width: 20,
              ),
            ],
    );
  }
}
