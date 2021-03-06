import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_call_app/web/controller/auth_controller.dart';
import 'package:language_call_app/web/providers/login.dart';
import 'package:language_call_app/web/utils/fix_password_css.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';
import '../../../widgets/web_responsive.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({Key? key}) : super(key: key);

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  TextEditingController controllerUsernameOrEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool? isRemembered = false;
  bool? isHovered = false;
  bool? isSpanHovered = false;
  bool isObscure = false;
  List<FocusNode>? focusNodeList = List.generate(3, (index) => FocusNode());
  FocusNode focusNode = FocusNode(canRequestFocus: true);
  AuthController? authController;
  void fixEdgePasswordRevealButton(FocusNode passwordFocusNode) {
    passwordFocusNode.unfocus();
    Future.microtask(() {
      passwordFocusNode.requestFocus();
      callMethod(Object,
        "fixPasswordCss",[]
      );
    });
  }

  @override
  void initState() {
    super.initState();
    authController = AuthController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final loginForm = Provider.of<Login>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        //  color: const Color(0xff1A1A40),
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
            if (loginForm.isAuthenticating)
              Container(
                alignment: Alignment.center,
                child: const LoadingIndicator(
                  indicatorType: Indicator.ballClipRotateMultiple,
                ),
              )
            else
              const SizedBox(
                height: 100,
              ),
            Container(
              margin: EdgeInsets.only(
                left: WebResponsive.isLargeScreen(context)
                    ? 300
                    : WebResponsive.isMediumScreen(context)
                        ? 150
                        : 0,
                right: WebResponsive.isLargeScreen(context)
                    ? 300
                    : WebResponsive.isMediumScreen(context)
                        ? 150
                        : 0,
              ),
              height: WebResponsive.isLargeScreen(context)
                  ? screenSize.height * 0.67
                  : screenSize.height * 0.73,
              width: screenSize.width,
              /*   decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.2),
              ), */
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    isAntiAlias: true,
                    "./assets/login.png",
                    height: 110,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      left: WebResponsive.isSmallScreen(context) ? 100 : 150,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      left: WebResponsive.isSmallScreen(context) ? 100 : 150,
                      right: WebResponsive.isSmallScreen(context) ? 100 : 150,
                    ),
                    child: const Text(
                      "Login in your account to use our services",
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: WebResponsive.isSmallScreen(context) ? 100 : 150,
                      right: WebResponsive.isSmallScreen(context) ? 100 : 150,
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: controllerUsernameOrEmail,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: focusNodeList?[0],
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: "Email or username",
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
                      onChanged: (value) => loginForm.setLoginInfo(value),
                      onFieldSubmitted: (value) =>
                          focusNodeList?[1].requestFocus(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: WebResponsive.isSmallScreen(context) ? 100 : 150,
                      right: WebResponsive.isSmallScreen(context) ? 100 : 150,
                    ),
                    child: TextFormField(
                      focusNode: focusNodeList?[1],
                      controller: controllerPassword,
                      obscureText: !isObscure,
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
                          color: !isObscure
                              ? Colors.white
                              : const Color(0xFF1A1A40),
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
                      onChanged: (value) {
                        fixEdgePasswordRevealButton(focusNodeList![1]);
                        loginForm.setPassword(value);
                      },
                      onFieldSubmitted: (value) =>
                          focusNodeList?[2].requestFocus(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: WebResponsive.isSmallScreen(context) ? 100 : 145,
                      right: WebResponsive.isSmallScreen(context) ? 100 : 150,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* Row(
                            children: [
                              Checkbox(
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                activeColor: Colors.blue,
                                focusColor: Colors.blue,
                                onChanged: (value) {
                                  setState(() {
                                    isRemembered = value;
                                  });
                                },
                                value: isRemembered,
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ), */
                        const SizedBox(
                          width: 5,
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {
                              QR.toName("ForgotPassword");
                            },
                            child: FocusableActionDetector(
                              onShowHoverHighlight: (value) => setState(() {
                                isHovered = value;
                              }),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: isHovered! && isHovered != null
                                      ? Colors.blue
                                      : Colors.white,
                                  fontWeight: FontWeight.w400,
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
                    margin: EdgeInsets.only(
                        left: WebResponsive.isSmallScreen(context) ? 100 : 150,
                        right: WebResponsive.isSmallScreen(context) ? 100 : 150,
                        top: 20),
                    child: FocusableActionDetector(
                      /*  enabled: true,
                        descendantsAreFocusable: true,
                        autofocus: true, */
                      //focusNode: focusNodeList?[2],
                      //  onFocusChange: (value) => print(value),
                      child: ElevatedButton(
                        focusNode: focusNodeList?[2],
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.transparent,
                          primary: Colors.blue,
                        ),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          authController?.login(loginForm.toJson());
                          focusNodeList?[2].unfocus();
                        },
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
                  text: "You don't have account? ",
                  style: const TextStyle(color: Colors.white),
                  children: [
                    WidgetSpan(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () => QR.toName("Register"),
                          child: FocusableActionDetector(
                            onShowHoverHighlight: (value) => setState(() {
                              isSpanHovered = value;
                            }),
                            child: Text(
                              " Create Account!",
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
