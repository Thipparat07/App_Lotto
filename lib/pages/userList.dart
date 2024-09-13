import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/adminMain.dart';
import 'package:project_01/pages/seemoreUser.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class userListPage extends StatefulWidget {
  int uid = 0;
  userListPage({super.key, required this.uid});

  @override
  State<userListPage> createState() => _userListPageState();
}

class _userListPageState extends State<userListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 135,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                                onTap: () => {
                                      log("Back to..."),
                                      Get.to(
                                          () => adminMainPage(
                                                uid: widget.uid,
                                              ),
                                          transition: Transition.circularReveal,
                                          duration: const Duration(seconds: 2))
                                    },
                                child: Image.asset(
                                    'assets/images/angle-left.png')),
                          )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "LOTTO",
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Text(
                  "ข้อมูลของสมาชิกทั้งหมด",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                log("User...");
                Get.to(() => seeUserPage(uid: widget.uid,),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 7.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "Username",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/seemore.png"))),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 229, 229),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
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
                                "ยืนยันการลบข้อมูลผู้ใช้ทั้งหมด?",
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(238, 78, 78, 10),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 7.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Text(
                    "ลบข้อมูลผู้ใช้ทั้งหมด",
                    style: TextStyle(
                        fontSize: 20,
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
        title: "ลบข้อมูลผู้ใช้เสร็จสิ้น",
        type: QuickAlertType.success);
  }
}
