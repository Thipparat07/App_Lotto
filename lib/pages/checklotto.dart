import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/mainPage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class checkLottoPage extends StatefulWidget {
  const checkLottoPage({super.key});

  @override
  State<checkLottoPage> createState() => _checkLottoPageState();
}

class _checkLottoPageState extends State<checkLottoPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(_validateInput);
  }

  void _validateInput() {
    if (_controller.text.length > 6) {
      _controller.text = _controller.text.substring(0, 6);
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

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
                              "ตรวจสอบรางวัล",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                    hintText: "กรอกตัวเลขเพื่อตรวจสลากฯ",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(163, 163, 163, 0.965),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: (value) {
                    log("Current input value: $value");
                    var correctNum = "123456";
                    if (value == correctNum) {
                      showCorrectDiaLog();
                    } else {
                      showNotCorrectDiaLog();
                    }
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
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

  void showCorrectDiaLog() {
    QuickAlert.show(
        context: context,
        title: "ยินดีด้วยคุณถูกรางวัล",
        text: "ระบบของเราจะทำการโอนเงินให้คุณ",
        type: QuickAlertType.success);
  }

  void showNotCorrectDiaLog() {
    QuickAlert.show(
        context: context,
        title: "เสียใจด้วยคุณไม่ถูกรางวัล",
        text: "ไว้มีโอกาสลองครั้งใหม่นะ T_T",
        type: QuickAlertType.error);
  }

  @override
  void dispose() {
    _controller.removeListener(_validateInput);
    _controller.dispose();
    super.dispose();
  }
}
