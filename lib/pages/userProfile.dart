import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:project_01/config/config.dart';
import 'package:project_01/model/customersDataGetResponse.dart';
import 'package:project_01/pages/login.dart';
import 'package:project_01/pages/mainPage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;

class Userprofile extends StatefulWidget {
  int uid = 0;
  Userprofile({super.key, required this.uid});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

var _isObscure = true;

class _UserprofileState extends State<Userprofile> {
  String url = '';
  Map<String, dynamic> userData = {}; // To store the user data
  TextEditingController _usernameController = TextEditingController();
  TextEditingController nameCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
    TextEditingController passwordCtl = TextEditingController();
  String image = '';


  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then((config) {
      setState(() {
        url = config[
            'apiEndpoint']; // Ensure setState is called to rebuild with new URL
      });
      log('API URL set to: $url');
      fetchUserData(widget.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  color: const Color(0xFF0085FF),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 7.0,
                        spreadRadius: 1.0)
                  ]),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerLeft,
                            height: 25,
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => MainPageLotto(
                                            uid: widget.uid,
                                          ),
                                      transition: Transition.circularReveal,
                                      duration: const Duration(seconds: 2));
                                },
                                child: Image.asset(
                                    'assets/images/angle-left.png')),
                          )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "โปรไฟล์ของคุณ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 120,
                      child: GestureDetector(
                        onTap: () {
                          log("Change profile...");
                        },
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 45,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.lightGreenAccent,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 230, 230, 0.965),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          // controller: _controller,


                          textAlign: TextAlign.center,

                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(163, 163, 163, 0.965),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onSubmitted: (value) {
    log("Username input value: $value");  // Log the entered value when submitted
  },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 45,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(
                        "Fullname",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.lightGreenAccent,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 230, 230, 0.965),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: nameCtl,

                          textAlign: TextAlign.center,

                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Fullname",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(163, 163, 163, 0.965),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onSubmitted: (value) {
                            log("Fullname input value: $value");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 45,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(
                        "Phone",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.lightGreenAccent,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 230, 230, 0.965),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: phoneCtl,

                          textAlign: TextAlign.center,

                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(163, 163, 163, 0.965),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onSubmitted: (value) {
                            log("Phone input value: $value");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 45,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.lightGreenAccent,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 230, 230, 0.965),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: emailCtl,

                          textAlign: TextAlign.center,

                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(163, 163, 163, 0.965),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onSubmitted: (value) {
                            log("Email input value: $value");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 45,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.lightGreenAccent,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 230, 230, 0.965),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: passwordCtl,
                          obscureText: _isObscure,
                          obscuringCharacter: "•",
                          textAlign: TextAlign.center,

                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(163, 163, 163, 0.965),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onSubmitted: (value) {
                            log("Password input value: $value");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 216, 216, 216),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 7.0,
                  spreadRadius: 1.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                log("Logedout...");
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 7.0,
                                  spreadRadius: 1.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              alignment: Alignment.center,
                              child: Text(
                                "ยืนยันการออกจากระบบ LOTTO?",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 220, 49, 49)),
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      log("ยกเลิกการลบข้อมูล");
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 10,
                                          right: 10),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 220, 49, 49),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade400,
                                                  offset:
                                                      const Offset(2.0, 2.0),
                                                  blurRadius: 7.0,
                                                  spreadRadius: 1.0)
                                            ]),
                                        child: Text(
                                          "ยกเลิก",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 10,
                                        right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        log("ยืนยันการลบข้อมูล");
                                        showAlert();
                                        Get.to(() => const LoginPage(),
                                            transition: Transition.fadeIn,
                                            duration:
                                                const Duration(seconds: 7));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(0, 175, 12, 10),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade400,
                                                  offset:
                                                      const Offset(2.0, 2.0),
                                                  blurRadius: 7.0,
                                                  spreadRadius: 1.0)
                                            ]),
                                        child: Text(
                                          "ยืนยัน",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(238, 78, 78, 10),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Text(
                    "Log out ออกจากระบบ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlert() {
    QuickAlert.show(
        context: context,
        title: "ออกจากระบบเสร็จสิ้น",
        type: QuickAlertType.success);
  }

  Future<void> fetchUserData(int uid) async { // Add your base URL here
    if (url.isEmpty) {
      print('API URL ยังไม่ถูกตั้งค่า.');
      return;
    }

    final apiUrl = '$url/customers/$uid';
    print('ส่งคำขอ GET ไปที่: $apiUrl');

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
      );

      print('ได้รับการตอบกลับด้วยรหัสสถานะ: ${response.statusCode}');
      print('เนื้อหาการตอบกลับ: ${response.body}');

      if (response.statusCode == 200) {
        final customersDataGetResponse = jsonDecode(response.body);
        print('ข้อมูลผู้ใช้ที่แยกออกมา: ${jsonEncode(customersDataGetResponse)}');

        setState(() {
          nameCtl.text = customersDataGetResponse['fullname'];
          phoneCtl.text = customersDataGetResponse['phoneNumber'];
          emailCtl.text = customersDataGetResponse['email'];
          image = customersDataGetResponse['image'];
          passwordCtl.text = customersDataGetResponse['password'];
        });

        print("ข้อมูลผู้ใช้ได้รับการอัปเดตในสถานะแล้ว.");
      } else {
        print('คำขอล้มเหลวด้วยสถานะ: ${response.statusCode}, เนื้อหา: ${response.body}');
      }
    } catch (e) {
      print('ข้อผิดพลาดระหว่างการ fetchUserData: $e');
    }
}

}
