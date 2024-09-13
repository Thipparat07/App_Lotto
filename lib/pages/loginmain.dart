import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_01/config/config.dart';
import 'package:project_01/model/customersloginPostResponse.dart';
import 'package:project_01/pages/adminMain.dart';
import 'package:project_01/pages/mainPage.dart';
import 'package:project_01/pages/register.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

import 'package:quickalert/widgets/quickalert_dialog.dart';

class Loginmain extends StatefulWidget {
  const Loginmain({super.key});

  @override
  State<Loginmain> createState() => _LoginmainState();
}

var _isObscure = true;

class _LoginmainState extends State<Loginmain> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String url = '';

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (config) {
        url = config['apiEndpoint'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              // color: Colors.amber,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF00BFFF), Color.fromARGB(255, 0, 98, 131)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'LOTTO',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white, // ใช้สีใดก็ได้เพื่อให้ข้อความไม่ใช่สีดำ
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 45,
              // color: const Color.fromARGB(255, 255, 129, 129),
              child: const Text(
                'Login',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 159, 159, 159)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // color: Colors.purple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 25,
                    // color: Colors.amber,
                    child: const Text('E-mail'),
                  ),
                  Container(
                      height: 50,
                      alignment: Alignment.center,
                      // padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                          cursorColor: Colors.black,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'E-mail',
                              hintStyle: const TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(
                                        255, 0, 0, 0), // สีขอบเมื่อโฟกัส
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0))))),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // color: Colors.purple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 25,
                    // color: Colors.amber,
                    child: const Text('Password'),
                  ),
                  Container(
                      height: 50,
                      alignment: Alignment.center,
                      // padding: const EdgeInsets.symmetric(horizontal: 15),

                      child: TextField(
                          cursorColor: Colors.black,
                          controller: _passwordController,
                          obscureText: _isObscure,
                          obscuringCharacter: "•",
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(10.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(
                                      255, 0, 0, 0), // สีขอบเมื่อโฟกัส
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                          ))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 30,
                alignment: Alignment.centerRight,
                // color: Colors.amber,
                child: InkWell(
                  onTap: () {
                    log('Waiting...');
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Color(0xFF0029FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 40,
              // color: Colors.deepOrangeAccent,
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: FilledButton(
                  onPressed: () => loginBtn(),
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xFF0085FF))),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 17),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              // color: Colors.amber,
              height: 35,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 35),
                      // color: Color.fromARGB(255, 114, 230, 126),
                      child: Container(
                          height: 1,
                          color: const Color.fromARGB(255, 159, 159, 159)),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: 40,
                      // color: Colors.cyan,
                      child: const Text(
                        'or',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 159, 159, 159)),
                      )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 35),
                      // color: Color.fromARGB(255, 114, 230, 126),
                      child: Container(
                          height: 1,
                          color: const Color.fromARGB(255, 159, 159, 159)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        // color: Colors.amber,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/GGLogo.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/FBLogo.png')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 50,
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have account?  ',
                    style: TextStyle(fontSize: 16, color: Color(0xFF898989)),
                  ),
                  InkWell(
                    onTap: () {
                      log('Will create method soon...');
                      Get.to(() => const RegisterPage(),
                          transition: Transition.circularReveal,
                          duration: const Duration(seconds: 2));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF0085FF),
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //ช่องว่างของด้านล่าง
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  void loginBtn() {
    log("Login");

    String emailValue = _emailController.text;
    String passwordValue = _passwordController.text;

    log("Email: $emailValue");
    log("Password: $passwordValue");

    if (emailValue.isEmpty) {
      showErrEmail();
      return;
    } else if (passwordValue.isEmpty) {
      showErrPassword();
      return;
    }

    var data = {"email": emailValue, "password": passwordValue};

    http
        .post(Uri.parse("$url/customers/login"),
            headers: {"Content-Type": "application/json; charset=utf-8"},
            body: jsonEncode(data))
        .then((value) {
      log(value.body);

      CustomersloginPostResponse customersloginPostResponse =
          customersloginPostResponseFromJson(value.body);

      log(customersloginPostResponse.message.toString());
      log(customersloginPostResponse.userId.toString());
      log(customersloginPostResponse.status.toString());

      if (customersloginPostResponse.status.toString() == '0') {
        Get.to(() => adminMainPage(uid: customersloginPostResponse.userId.toInt()),
            transition: Transition.circularReveal,
            duration: const Duration(seconds: 2));
      } else if (customersloginPostResponse.status.toString() == '1') {
        Get.to(() => MainPageLotto(uid: customersloginPostResponse.userId.toInt()),
            transition: Transition.circularReveal,
            duration: const Duration(seconds: 2));
      } else {
        log('Unknown status: ${customersloginPostResponse.status}');
      }
    }).catchError((error) {
      log('Error: $error');
      showErrDialog();
    });
  }

  void showErrDialog() {
    QuickAlert.show(
        context: context,
        title: "ข้อผิดพลาด",
        text: "E-mail หรือ Password ไม่ถูกต้อง",
        type: QuickAlertType.error);
  }

  void showErrEmail() {
    QuickAlert.show(
        context: context,
        title: "ข้อผิดพลาด",
        text: "กรุณากรอก E-mail",
        type: QuickAlertType.error);
  }

  void showErrPassword() {
    QuickAlert.show(
        context: context,
        title: "ข้อผิดพลาด",
        text: "กรุณากรอก Password",
        type: QuickAlertType.error);
  }
}
