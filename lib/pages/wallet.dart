import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/mainPage.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                                onTap: () {
                                  log("Back to...");
                                  Get.to(() => const MainPageLotto(),
                                      transition: Transition.circularReveal,
                                      duration: const Duration(seconds: 2));
                                },
                                child: Image.asset(
                                    'assets/images/angle-left.png')),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "LOTTO",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 63, 121, 247)),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 210,
                decoration: BoxDecoration(
                  color: const Color(0xFF0085FF),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(2, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 4, // เบลอเงา
                      spreadRadius: 0, // ไม่มีการขยายเงา
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: const Text("จำนวนเงินที่ใช้ได้",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                            Expanded(
                              child: Container(
                                height: 70,
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    radius: 35,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 30),
                        height: 40,
                        child: const Text(
                          "XXXXXXX",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 120, 230, 10),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )),
                      child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "บัญชีของคุณ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Transcription",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0085FF),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0, 5), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 10, // เบลอเงา
                      spreadRadius: 0, // ไม่มีการขยายเงา
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "จ่ายค่าสินค้า/บริการ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "1000",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0, 5), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 10, // เบลอเงา
                      spreadRadius: 0, // ไม่มีการขยายเงา
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "เงินเข้า",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "1000",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 105, 244, 54)),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
