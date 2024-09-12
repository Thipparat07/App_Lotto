import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/checklotto.dart';
import 'package:project_01/pages/findLotto.dart';
import 'package:project_01/pages/userProfile.dart';
import 'package:project_01/pages/wallet.dart';

class MainPageLotto extends StatefulWidget {
  const MainPageLotto({super.key});

  @override
  State<MainPageLotto> createState() => _MainPageLottoState();
}

class _MainPageLottoState extends State<MainPageLotto> {
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
                        color: Colors.grey.shade400,
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        spreadRadius: 1.0)
                  ]),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    height: 40,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          // color: Color.fromARGB(255, 255, 152, 7),
                          child: const Text(
                            "Welcome To ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            ' LOTTO',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                height: 180,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(163, 211, 255, 4),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: 40,
                        // color: Colors.amber,
                        child: const Text(
                          "LOTTO",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        height: 135,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              log("Account");
                                              Get.to(() => const WalletPage(),
                                                  transition:
                                                      Transition.circularReveal,
                                                  duration: const Duration(
                                                      seconds: 2));
                                            },
                                            child: Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    39, 99, 18, 10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/payment.png")),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: const Offset(2,
                                                        2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                                    blurRadius: 2, // เบลอเงา
                                                    spreadRadius:
                                                        0, // ไม่มีการขยายเงา
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "บัญชี",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      39, 99, 18, 10)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              log("examine");
                                              Get.to(
                                                  () => const checkLottoPage(),
                                                  transition:
                                                      Transition.circularReveal,
                                                  duration: const Duration(
                                                      seconds: 2));
                                            },
                                            child: Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    244, 206, 20, 10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/pageview.png")),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: const Offset(2,
                                                        2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                                    blurRadius: 2, // เบลอเงา
                                                    spreadRadius:
                                                        0, // ไม่มีการขยายเงา
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "ตรวจสอบรางวัล",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      244, 206, 20, 10)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              log("SearchLotto...");
                                              Get.to(
                                                  () => const findLottoPage(),
                                                  transition:
                                                      Transition.circularReveal,
                                                  duration: const Duration(
                                                      seconds: 2));
                                            },
                                            child: Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    238, 78, 78, 10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/search.png")),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: const Offset(2,
                                                        2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                                    blurRadius: 2, // เบลอเงา
                                                    spreadRadius:
                                                        0, // ไม่มีการขยายเงา
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "ค้นหาสลากฯ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      238, 78, 78, 10)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              log("ProfileUser...");
                                              Get.to(() => const Userprofile(),
                                                  transition:
                                                      Transition.circularReveal,
                                                  duration: const Duration(
                                                      seconds: 2));
                                            },
                                            child: Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    0, 133, 255, 10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/profileA.png")),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: const Offset(2,
                                                        2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                                    blurRadius: 2, // เบลอเงา
                                                    spreadRadius:
                                                        0, // ไม่มีการขยายเงา
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "โปรไฟล์",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 133, 255, 10)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 40,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "เลขเด็ดงวดนี้",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 133, 255, 10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(2, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 4, // เบลอเงา
                      spreadRadius: 0, // ไม่มีการขยายเงา
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(248, 199, 229, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 17,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: 50,
                                          child: const Text(
                                            "เลขหน้า",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          child: Text(
                                            "XXX",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade700),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 50,
                                          child: const Text(
                                            "ประเภท",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "ชุด",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade700),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            offset: const Offset(
                                                2, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                            blurRadius: 4, // เบลอเงา
                                            spreadRadius: 0, // ไม่มีการขยายเงา
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        "XXXXXX",
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                0, 133, 255, 10)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 17,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "ล็อตเตอรี่ By ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                          Expanded(
                                              child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: const Text(" LOTTO"),
                                          )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "จำนวน  ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "XXX",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "   ชุด",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 35,
                                            child: const Text(
                                              "เลือก",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 60,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: const Text("1"),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 20,
                                            child: const Text(
                                              "ใบ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              log("Add");
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 25,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/addbtn.png"))),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              log("Remove");
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 25,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/removebtn.png"))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 35,
                                            child: const Text(
                                              "ราคา",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 80,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: const Text("XXXX"),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 25,
                                            child: const Text(
                                              "บาท",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              log("AddItem");
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 25,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/cart.png"))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 225, 225, 225),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(2.0, 3.0),
                  blurRadius: 7.0,
                  spreadRadius: 1.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  log("ButLotto page...");
                  Get.to(() => const findLottoPage(),
                      transition: Transition.circularReveal,
                      duration: const Duration(seconds: 2));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xFF0085FF),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Text(
                    "ซื้อสลากกินแบ่งรัฐบาล ออนไลน์",
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
}
