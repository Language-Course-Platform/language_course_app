import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';

class WebRegister extends StatefulWidget {
  const WebRegister({Key? key}) : super(key: key);

  @override
  State<WebRegister> createState() => _WebRegisterState();
}

class _WebRegisterState extends State<WebRegister> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool? isTermsAccepted = false;
  bool? isHovered = false;
  bool? isSpanHovered = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.only(left: 250, right: 250),
              height: screenSize.height * 0.70,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 10, left: 150),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 10, left: 150),
                    child: const Text(
                      "Create your account to explore our services",
                      textAlign: TextAlign.center,
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
                      controller: controllerUsername,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: "Username",
                        prefixIcon: Container(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.person,
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
                            Icons.alternate_email,
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
                    margin: const EdgeInsets.only(left: 150, right: 150),
                    child: TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: Container(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            FontAwesomeIcons.lock,
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
                  Container(
                    margin:
                        const EdgeInsets.only(left: 145, top: 20, right: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              activeColor: Colors.blue,
                              focusColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  isTermsAccepted = value;
                                });
                              },
                              value: isTermsAccepted,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "I read and agree to \nthe Terms & Conditions",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Material(
                          type: MaterialType.transparency,
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              QR.toName("ForgotPassword");
                            },
                            child: FocusableActionDetector(
                              onShowHoverHighlight: (value) => setState(() {
                                isHovered = value;
                              }),
                              descendantsAreFocusable: true,
                              enabled: true,
                              child: Text(
                                "Need Help?",
                                style: TextStyle(
                                  color: isHovered! && isHovered != null
                                      ? Colors.blue
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(color: Colors.white),
                  children: [
                    WidgetSpan(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () => QR.to("/login", ignoreSamePath: true),
                          child: FocusableActionDetector(
                            onShowHoverHighlight: (value) => setState(() {
                              isSpanHovered = value;
                            }),
                            descendantsAreFocusable: true,
                            autofocus: true,
                            enabled: true,
                            child: Text(
                              "Login!",
                              style: TextStyle(
                                color: isSpanHovered! && isSpanHovered != null
                                    ? Colors.blue
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
