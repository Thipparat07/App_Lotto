import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/buyhistory.dart';
import 'package:project_01/pages/lottoList.dart';
import 'package:project_01/pages/mainPage.dart';

class findLottoPage extends StatefulWidget {
  const findLottoPage({super.key});

  @override
  State<findLottoPage> createState() => _findLottoPageState();
}

class _findLottoPageState extends State<findLottoPage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

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
                                onTap: () {
                                  log("Back to...");
                                  Get.to(() => const MainPageLotto(),
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
                              "ค้นหาสลากฯ",
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
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Welcome To ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" LOTTO",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(1, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 3, // เบลอเงา
                      spreadRadius: 0, // ไม่มีการขยายเงา
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  log("To page cart...");
                                  Get.to(() => const lottoListPage(),
                                      transition: Transition.circularReveal,
                                      duration: const Duration(seconds: 2));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 1),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 175, 12, 10),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade600,
                                          offset: const Offset(
                                              2, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                          blurRadius: 2, // เบลอเงา
                                          spreadRadius: 0, // ไม่มีการขยายเงา
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "รายการคำสั่งซื้อ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.965),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color.fromRGBO(
                                            255, 255, 255, 0.965),
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  log("To histo lotto...");
                                  Get.to(() => const buyHistoryPage(),
                                      transition: Transition.circularReveal,
                                      duration: const Duration(seconds: 2));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 1),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 220, 49, 49),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade600,
                                          offset: const Offset(
                                              2, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                          blurRadius: 2, // เบลอเงา
                                          spreadRadius: 0, // ไม่มีการขยายเงา
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "ประวัติการสั่งซื้อ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.965),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color.fromRGBO(
                                            255, 255, 255, 0.965),
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        // color: const Color.fromARGB(255, 52, 7, 255),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (index) {
                            return Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.symmetric(horizontal: 7.5),
                              child: TextField(
                                controller: _controllers[index],
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                cursorColor:
                                    Colors.black, // เปลี่ยนเป็นสีที่คุณต้องการ
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        width:
                                            2.0), // สีและความหนาของ border เมื่อ focus
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width:
                                            1.0), // สีและความหนาของ border เมื่อไม่มี focus
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical:
                                          8), // เพิ่ม padding แนวตั้งเพื่อให้ข้อความอยู่กลาง
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index < 5) {
                                      // ถ้าค่ามีและ index ไม่ใช่ช่องสุดท้าย ให้ไปที่ช่องถัดไป
                                      FocusScope.of(context).nextFocus();
                                    }
                                  } else {
                                    if (index > 0) {
                                      // ถ้าค่าที่กรอกหายไปและ index ไม่ใช่ช่องแรก ให้กลับไปที่ช่องก่อนหน้า
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      log("Random number");
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 7),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(217, 217, 217, 10),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade600,
                                              offset: const Offset(2,
                                                  2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                              blurRadius: 2, // เบลอเงา
                                              spreadRadius:
                                                  0, // ไม่มีการขยายเงา
                                            ),
                                          ],
                                        ),
                                        child: Text("สุ่มตัวเลข",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  )),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      log("Clear number");
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 7),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(0, 133, 255, 10),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade600,
                                              offset: const Offset(2,
                                                  2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                              blurRadius: 2, // เบลอเงา
                                              spreadRadius:
                                                  0, // ไม่มีการขยายเงา
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          "ล้างค่า",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            )),
                            Expanded(
                                child: GestureDetector(
                              onTap: findNum,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 7),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 133, 255, 10),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade600,
                                        offset: const Offset(
                                            2, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                                        blurRadius: 2, // เบลอเงา
                                        spreadRadius: 0, // ไม่มีการขยายเงา
                                      ),
                                    ],
                                  ),
                                  child: Text("ค้นหา",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 40,
                alignment: Alignment.centerLeft,
                child: Text(
                  "ผลการค้นหา",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(248, 199, 229, 255),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(2, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 2, // เบลอเงา
                      spreadRadius: 0, // ไม่มีการขยายเงา
                    ),
                  ],
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
            ),
          ],
        ),
      ),
    );
  }

  //           ******ยังไม่เสร็จสมบูรณ์ถ้าเลขซ้ำมีนจะแสดงแค่อันเดียว (มันเก็บตัวเลขซ้ำ) ต้องเป็นเลขไม่ซ้ำ
  void findNum() {
    // สร้าง Set เพื่อเก็บค่าที่ไม่ซ้ำกัน
    Set<String> uniqueNumbers = {};

    // เพิ่มค่าที่กรอกเข้ามาจากแต่ละ TextEditingController ไปยัง Set
    for (var controller in _controllers) {
      String input = controller.text;

      if (input.isNotEmpty) {
        uniqueNumbers.add(input);
      }
    }

    // รวมค่าที่ไม่ซ้ำกันเป็นสตริงเดียว
    String combinedString = uniqueNumbers.join('');

    // แสดงผลใน log
    log("Input numbers: $combinedString");
  }
}
