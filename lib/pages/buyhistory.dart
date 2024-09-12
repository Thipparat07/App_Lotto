import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/findLotto.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class buyHistoryPage extends StatefulWidget {
  const buyHistoryPage({super.key});

  @override
  State<buyHistoryPage> createState() => _buyHistoryPageState();
}

class _buyHistoryPageState extends State<buyHistoryPage> {
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
                                      Get.to(() => const findLottoPage(),
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
                              "ประวัติการสั่งซื้อ",
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
            Container(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 110,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                    color: Colors.grey.shade500,
                                    offset: const Offset(
                                        0, 1), // ย้ายเงาเฉพาะในแนวดิ่ง
                                    blurRadius: 10, // เบลอเงา
                                    spreadRadius: 0, // ไม่มีการขยายเงา
                                  ),
                                ],
                              ),
                              child: const Text(
                                "XXXXXX",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 133, 255, 10)),
                              ),
                            ),
                          ),
                          Container(
                            height: 17,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "เลขหน้า  ",
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
                                    width: 50,
                                    child: const Text(
                                      "จำนวน",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 80,
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
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    log("CheckLotto...");
                                    var num = "123456";
                                    if (num == "123456") {
                                      showCorrectLotto();
                                    } else {
                                      showNotCorrectLotto();
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 120,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 175, 12, 10),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: const Offset(
                                                0, 5), // ย้ายเงาเฉพาะในแนวดิ่ง
                                            blurRadius: 10, // เบลอเงา
                                            spreadRadius: 0, // ไม่มีการขยายเงา
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        "ตรวจสอบรางวัล",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    log("delete");
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/bin.png"))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  void showCorrectLotto() {
    QuickAlert.show(
        context: context,
        title: "ยินดีด้วยคุณถูกรางวัล",
        text: "ระบบของเราจะทำการโอนเงินให้คุณ",
        confirmBtnText: "ตกลง",
        type: QuickAlertType.success);
  }

  void showNotCorrectLotto() {
    QuickAlert.show(
        context: context,
        title: "เสียใจด้วยคุณไม่ถูกรางวัล",
        text: "ไว้มีโอกาสลองครั้งใหม่นะ T_T",
        confirmBtnText: "ตกลง",
        type: QuickAlertType.error);
  }
}
