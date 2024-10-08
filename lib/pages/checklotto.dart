import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/pages/mainPage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class checkLottoPage extends StatefulWidget {
  int uid = 0;
  checkLottoPage({super.key, required this.uid});

  @override
  State<checkLottoPage> createState() => _checkLottoPageState();
}

class _checkLottoPageState extends State<checkLottoPage> {
  final TextEditingController _controller = TextEditingController();
  Map<String, String> lottoResults = {
    'first': 'XXXXXX',
    'second': 'XXXXXX',
    'third': 'XXXXXX',
    'fourth': 'XXXXXX',
    'fifth': 'XXXXXX',
  };
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_validateInput);
    fetchLottoResults();
  }

  Future<void> fetchLottoResults() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http
          .get(Uri.parse('https://app-lotto-api.onrender.com/lotto/results'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['success'] == true && data['data'] != null) {
          final resultData = data['data'] as Map<String, dynamic>;
          setState(() {
            lottoResults = {
              'first': resultData['first']?.toString() ?? 'XXXXXX',
              'second': resultData['second']?.toString() ?? 'XXXXXX',
              'third': resultData['third']?.toString() ?? 'XXXXXX',
              'fourth': resultData['fourth']?.toString() ?? 'XXXXXX',
              'fifth': resultData['fifth']?.toString() ?? 'XXXXXX',
            };
            isLoading = false;
          });
        } else {
          throw Exception('Failed to load lotto results: ${data['message']}');
        }
      } else {
        throw Exception('Failed to load lotto results');
      }
    } catch (e) {
      log('Error fetching lotto results: $e');
      setState(() {
        isLoading = false;
      });
    }
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                                        Get.to(() => MainPageLotto(uid: widget.uid,),
                                            transition:
                                                Transition.circularReveal,
                                            duration:
                                                const Duration(seconds: 2));
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
                          if (lottoResults.containsValue(value)) {
                            showCorrectDialog();
                          } else {
                            showNotCorrectDialog();
                          }
                        },
                      ),
                    ),
                  ),
                  buildPrizeDisplay(
                      "รางวัลที่ 1", "6,000,000", lottoResults['first']!),
                  buildPrizeRow(
                      "รางวัลที่ 2",
                      "200,000",
                      lottoResults['second']!,
                      "รางวัลที่ 3",
                      "80,000",
                      lottoResults['third']!),
                  buildPrizeRow(
                      "รางวัลที่ 4",
                      "40,000",
                      lottoResults['fourth']!,
                      "รางวัลที่ 5",
                      "20,000",
                      lottoResults['fifth']!),
                ],
              ),
            ),
    );
  }

  Widget buildPrizeDisplay(String title, String amount, String number) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: 130,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "รางวัลละ $amount บาท",
                    style: const TextStyle(
                        fontSize: 10.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  number,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0085FF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrizeRow(String title1, String amount1, String number1,
      String title2, String amount2, String number2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        margin: const EdgeInsets.only(top: 35),
        height: 110,
        child: Row(
          children: [
            Expanded(
              child: buildPrizeColumn(title1, amount1, number1),
            ),
            Expanded(
              child: buildPrizeColumn(title2, amount2, number2),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrizeColumn(String title, String amount, String number) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 20,
          child: Text(
            "รางวัลละ $amount บาท",
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 40,
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0085FF),
            ),
          ),
        ),
      ],
    );
  }

  void showCorrectDialog() {
    QuickAlert.show(
      context: context,
      title: "ยินดีด้วยคุณถูกรางวัล",
      text: "ระบบของเราจะทำการโอนเงินให้คุณ",
      type: QuickAlertType.success,
    );
  }

  void showNotCorrectDialog() {
    QuickAlert.show(
      context: context,
      title: "เสียใจด้วยคุณไม่ถูกรางวัล",
      text: "ไว้มีโอกาสลองครั้งใหม่นะ T_T",
      type: QuickAlertType.error,
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_validateInput);
    _controller.dispose();
    super.dispose();
  }
}
