import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/adminProfile.dart';
import 'package:project_01/pages/showLottoAdmin.dart';
import 'package:project_01/pages/userList.dart';

class adminMainPage extends StatefulWidget {
  const adminMainPage({super.key});

  @override
  State<adminMainPage> createState() => _adminMainPageState();
}

class _adminMainPageState extends State<adminMainPage> {
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
                      color: Colors.grey.shade500,
                      offset: const Offset(0, 4), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 10, // เบลอเงา
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
                                              log("examine");
                                              Get.to(
                                                  () =>
                                                      const showLottoAdminPage(),
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
                                                          "assets/images/pageview.png"))),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "ตรวจสอบสลากฯ",
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
                                              log("User");
                                              Get.to(() => const userListPage(),
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
                                                          "assets/images/personG.png"))),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "ผู้ใช้งานระบบ",
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
                                              log("ProfileAdmin");
                                              Get.to(
                                                  () =>
                                                      const adminProfilePage(),
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
                                                          "assets/images/profileA.png"))),
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 120,
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
                        height: 30,
                        child: Text(
                          "รางวัลที่ 1",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 133, 255, 10),
                              fontWeight: FontWeight.bold),
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
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                log("Search number");
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 7),
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
                                  child: Text("สุ่มตัวเลข",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                            )),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                log("Search number");
                              },
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
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
