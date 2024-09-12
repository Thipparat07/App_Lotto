import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/adminMain.dart';
import 'package:project_01/pages/loginmain.dart';

class showLottoAdminPage extends StatefulWidget {
  const showLottoAdminPage({super.key});

  @override
  State<showLottoAdminPage> createState() => _showLottoAdminPageState();
}

class _showLottoAdminPageState extends State<showLottoAdminPage> {
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
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 25,
                            child: GestureDetector(
                                onTap: () {
                                  log("Back Admin...");
                                  Get.to(() => const adminMainPage(),
                                      transition: Transition.circularReveal,
                                      duration: const Duration(seconds: 2));
                                },
                                child: Image.asset(
                                    'assets/images/angle-left.png')),
                          ),
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "ตรวจสอบความถูกค้อง",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              height: 130,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: const Text(
                          "รางวัลที่ 1",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        child: const Text(
                          "รางวัลละ 6,000,000 บาท",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "XXXXXX",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0085FF),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                margin: const EdgeInsets.only(top: 35),
                height: 110,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text(
                            "รางวัลที่ 2",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          height: 30,
                          child: const Text("รางวัลละ 200,000 บาท",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text("XXXXXX",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0085FF))),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text(
                            "รางวัลที่ 3",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          height: 30,
                          child: const Text("รางวัลละ 80,000 บาท",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text("XXXXXX",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0085FF))),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                margin: const EdgeInsets.only(top: 35),
                height: 110,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text(
                            "รางวัลที่ 4",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          height: 30,
                          child: const Text("รางวัลละ 40,000 บาท",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text("XXXXXX",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0085FF))),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text(
                            "รางวัลที่ 5",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          height: 30,
                          child: const Text("รางวัลละ 20,000 บาท",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: const Text("XXXXXX",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0085FF))),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void backToMainpage(BuildContext contex) {
    log("Back...");
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Loginmain(),
        ));
  }
}
