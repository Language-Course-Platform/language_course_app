import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_call_app/web/controller/auth_controller.dart';
import 'package:language_call_app/web/ui/widgets/web_responsive.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../../providers/register.dart';

class WebRegister extends StatefulWidget {
  const WebRegister({Key? key}) : super(key: key);

  @override
  State<WebRegister> createState() => _WebRegisterState();
}

class _WebRegisterState extends State<WebRegister> {
  final globalkey = GlobalKey();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool? isHovered = false;
  bool? isSpanHovered = false;
  bool isObscure = false;
  ValueNotifier<bool?> isTermsAccepted = ValueNotifier<bool?>(false);
  AuthController? authController;
  bool enterIspressed = false;
  List<FocusNode>? focusNodes;
  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (index) => FocusNode());

    authController = AuthController(context: context);
  }

  @override
  void dispose() {
    super.dispose();
    focusNodes?.forEach((element) {
      element.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final registerForm = Provider.of<Register>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        // color: const Color(0xff1A1A40),
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
          //padding: const EdgeInsets.only(top: 40),
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: WebResponsive.isLargeScreen(context) ? 300 : 150,
                  right: WebResponsive.isLargeScreen(context) ? 300 : 150),
              height: WebResponsive.isLargeScreen(context)
                  ? screenSize.height * 0.67
                  : screenSize.height * 0.73,
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
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 150,
                      right: 150,
                    ),
                    child: const Text(
                      "Create your account to explore our services",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 150, right: 150),
                    child: TextFormField(
                      focusNode: focusNodes?[0],
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
                      onChanged: (value) => registerForm.setUsername(value),
                      onFieldSubmitted: (value) {
                        focusNodes?[1].requestFocus();
                      },
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
                      focusNode: focusNodes?[1],
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
                      onChanged: (value) => registerForm.setEmail(value),
                      onFieldSubmitted: (value) {
                        focusNodes?[2].requestFocus();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 150, right: 150),
                    child: TextFormField(
                      controller: controllerPassword,
                      obscureText: !isObscure,
                      focusNode: focusNodes?[2],
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
                        suffixIcon: IconButton(
                          icon: Icon(!isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: !isObscure ? Colors.white : Color(0xFF1A1A40),
                          onPressed: () {
                            if (!isObscure) {
                              setState(() {
                                isObscure = true;
                              });
                            } else {
                              setState(() {
                                isObscure = false;
                              });
                            }
                          },
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
                      onFieldSubmitted: (data) {
                        focusNodes?[3].requestFocus();
                      },
                      onChanged: (value) => registerForm.setPassword(value),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 145, top: 20, right: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder<bool?>(
                            valueListenable: isTermsAccepted,
                            builder: (context, valueTerms, _) {
                              return Checkbox(
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                activeColor: Colors.blue,
                                focusColor: Colors.blue,
                                onChanged: (value) {
                                  isTermsAccepted.value = value!;
                                  isTermsAccepted.notifyListeners();
                                },
                                value: valueTerms,
                              );
                            }),
                        const SizedBox(
                          width: 5,
                        ),
                        const Expanded(
                          child: Text(
                            "I read and agree to the Terms & Conditions",
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*  const SizedBox(
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
                            ), */
                  ),
                  ValueListenableBuilder<bool?>(
                    valueListenable: isTermsAccepted,
                    builder: (context, valueTerms, _) {
                      return Container(
                        width: screenSize.width,
                        height: 50,
                        margin: const EdgeInsets.only(
                            left: 150, right: 150, top: 20),
                        child: FocusableActionDetector(
                          autofocus: true,
                          child: ElevatedButton(
                            autofocus: true,
                            focusNode: focusNodes?[3],
                            onFocusChange: (value) {
                              if (focusNodes![3].hasFocus) {
                                focusNodes![3].unfocus;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.transparent,
                              primary: Colors.blue,
                            ),
                            onPressed: valueTerms != null && !valueTerms
                                ? null
                                : () {
                                    QR.to("/home");
                                    /* authController?.register({
                                      "username": registerForm.username,
                                      "password": registerForm.password,
                                      "email": registerForm.password,
                                    }); */
                                    focusNodes![3].unfocus();
                                  },
                            /* () => authController?.register({
                                        "username": registerForm.username,
                                        "password": registerForm.password,
                                        "email": registerForm.password,
                                      }), */
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
