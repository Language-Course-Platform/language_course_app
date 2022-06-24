import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';

class WebForgotPassword extends StatefulWidget {
  const WebForgotPassword({Key? key}) : super(key: key);

  @override
  State<WebForgotPassword> createState() => _WebForgotPasswordState();
}

class _WebForgotPasswordState extends State<WebForgotPassword> {
  TextEditingController controllerEmail = TextEditingController();
  bool? isArrowBackHovered = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 250,
        leading: Container(
          margin: const EdgeInsets.only(left: 20, right: 50),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => QR.back(),
              child: FocusableActionDetector(
                onShowHoverHighlight: (value) => setState(() {
                  isArrowBackHovered = value;
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: isArrowBackHovered != null && isArrowBackHovered!
                          ? Colors.blue
                          : Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Back to Login",
                      style: TextStyle(
                        color: isArrowBackHovered != null && isArrowBackHovered!
                            ? Colors.blue
                            : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: const Color(0xff1A1A40),
        child: ListView(
          //padding: const EdgeInsets.only(top: 40),
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(left: 250, right: 250),
              height: screenSize.height * 0.73,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      isAntiAlias: true,
                      "./assets/email.png",
                      height: 200,
                      width: 200,
                      scale: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 150),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(top: 10, left: 150, right: 250),
                    child: const Text(
                      "Please use your email registered on our platform to recover your password",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 150, right: 150),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: "Email",
                        prefixIcon: Container(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenSize.width,
                    height: 50,
                    margin:
                        const EdgeInsets.only(left: 150, right: 150, top: 20),
                    child: FocusableActionDetector(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        child: const Text(
                          "Recover Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
