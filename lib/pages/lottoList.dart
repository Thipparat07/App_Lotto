import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/findLotto.dart';
import 'package:quickalert/quickalert.dart';

class lottoListPage extends StatefulWidget {
  const lottoListPage({super.key});

  @override
  State<lottoListPage> createState() => _lottoListPageState();
}

class _lottoListPageState extends State<lottoListPage> {
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
                                onTap: () => {
                                      log("Back to..."),
                                      Get.to(() => const findLottoPage(),
                                          transition: Transition.circularReveal,
                                          duration: const Duration(seconds: 2))
                                    },
                                child: Image.asset(
                                    'assets/images/angle-left.png')),
                          ),
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "รายการสั่งซื้อทั้งหมด",
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      log("Remove");
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 5),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
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
                                      log("-");
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
                                      child: const Text("XXXX"),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    child: const Text(
                                      "บาทถ้วน",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
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
                    builder: (BuildContext contex) {
                      return SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 120,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(248, 199, 229, 255),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text("ค่าลอตเตอรี่ฉบับละ"),
                                            )),
                                            Expanded(
                                                child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Text("100.00 บาท"),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text("จำนวน"),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text("X"),
                                                        )),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(" ใบ"),
                                                        ),
                                                      ],
                                                    ))),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "ยอดรวมทั้งสิ้น",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text("XXXX",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        )),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(" บาท",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ],
                                                    ))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        log("ยกเลิก");
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(238, 78, 78, 10),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Text("ยกเลิก",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        log("ชำระเงินแล้ว");
                                        showAlert();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(0, 175, 12, 10),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Text(
                                            "ชำระเงิน",
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
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 175, 12, 10),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "ชำระเงิน",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlert() {
    QuickAlert.show(
        context: context,
        title: "ชำระเงินสำเร็จ",
        confirmBtnText: "ตกลง",
        type: QuickAlertType.success);
  }
}
