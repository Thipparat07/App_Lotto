import 'dart:developer';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/config/config.dart';
import 'package:project_01/pages/adminProfile.dart';
import 'package:project_01/pages/showLottoAdmin.dart';
import 'package:project_01/pages/userList.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class adminMainPage extends StatefulWidget {
  int uid = 0;
  adminMainPage({super.key, required this.uid});

  @override
  State<adminMainPage> createState() => _adminMainPageState();
}

class _adminMainPageState extends State<adminMainPage> {
  @override
  Widget build(BuildContext context) {
    print('Customer id: ${widget.uid}');
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
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
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 0,
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
                                              print("User");
                                              Get.to(() => userListPage(uid: widget.uid,),
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
                                              print("ProfileAdmin");
                                              Get.to(
                                                  () =>
                                                      adminProfilePage(uid: widget.uid,),
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
            LottoPrizeCategories(),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
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
                  print("reset btn...");
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 250,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
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
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "ยืนยันการรีเซ็ทระบบใหม่ทั้งหมด?",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 220, 49, 49)),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        "ข้อมูลทุกอย่างในระบบจะหายไป (ทั้งสลากฯและผู้ใช้งานระบบ)",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 220, 49, 49)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        print("ยกเลิกการลบข้อมูล");
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
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
                                          child: const Text(
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
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 10,
                                          right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          print("ยืนยันการลบข้อมูล");
                                          showAlert();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  0, 175, 12, 10),
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
                                          child: const Text(
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
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xFF0085FF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Text(
                    "รีเซ็ทระบบ LOTTO ทั้งหมด",
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
    void showAlert() {
    QuickAlert.show(
        context: context,
        title: "รีเซ็ทระบบใหม่เสร็จสิ้น",
        confirmBtnText: ("ตกลง"),
        type: QuickAlertType.success);
  }
    
}

class LottoPrizeCategories extends StatefulWidget {
  const LottoPrizeCategories({Key? key}) : super(key: key);

  @override
  _LottoPrizeCategoriesState createState() => _LottoPrizeCategoriesState();
}

class _LottoPrizeCategoriesState extends State<LottoPrizeCategories> {
    String url = '';

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (config) {
        url = config['apiEndpoint'];
      },
    );
  }



  final List<List<TextEditingController>> _controllers =
      List.generate(5, (_) => List.generate(6, (_) => TextEditingController()));
  final List<bool> _isDrawn = List.generate(5, (_) => false);
  bool _isSaved = false;

  Future<void> _drawNumberFromAPI(int categoryIndex) async {
    if (_isDrawn[categoryIndex]) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('รางวัลนี้ถูกสุ่มไปแล้ว')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('$url/admin/draw-one'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['success'] == true && data['drawnLotto'] != null) {
          String lottoNumber = data['drawnLotto']['lotto_number'];
          setState(() {
            for (int i = 0; i < 6; i++) {
              _controllers[categoryIndex][i].text = lottoNumber[i];
            }
            _isDrawn[categoryIndex] = true;
          });
        } else {
          throw Exception('รูปแบบการตอบกลับไม่ถูกต้องหรือไม่มีการสุ่มหมายเลข');
        }
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'การสุ่มหมายเลขล้มเหลว');
      } else {
        throw Exception(
            'การสุ่มหมายเลขล้มเหลว รหัสสถานะ: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ข้อผิดพลาด: ${e.toString()}')),
      );
    }
  }

  Future<void> _saveAllDrawnNumbers() async {
    if (_isSaved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('หมายเลขทั้งหมดถูกบันทึกไปแล้ว')),
      );
      return;
    }

    int drawnCount = _isDrawn.where((drawn) => drawn).length;
    if (drawnCount < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('กรุณาสุ่มหมายเลขให้ครบทั้ง 5 รางวัลก่อนบันทึก')),
      );
      return;
    }

    List<Map<String, dynamic>> drawnNumbers = [];
    for (int i = 0; i < 5; i++) {
      String drawnNumber =
          _controllers[i].map((controller) => controller.text).join();
      drawnNumbers.add({
        'categoryIndex': i,
        'drawnNumber': drawnNumber,
      });
    }

    try {
      final response = await http.post(
        Uri.parse(
            '$url/admin/save-drawn-numbers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'drawnNumbers': drawnNumbers}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _isSaved = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('บันทึกหมายเลขที่สุ่มทั้งหมดสำเร็จ')),
        );
      } else {
        throw Exception('การบันทึกหมายเลขล้มเหลว');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('ข้อผิดพลาดในการบันทึกหมายเลข: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 5; i++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(1, 2),
                    blurRadius: 3,
                    spreadRadius: 0,
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
                        "รางวัลที่ ${i + 1}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 133, 255, 10),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: TextField(
                              controller: _controllers[i][index],
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              readOnly: true,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _drawNumberFromAPI(i),
                      child: Container(
                        width: 120,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _isDrawn[i]
                              ? Colors.grey
                              : Color.fromRGBO(0, 175, 12, 10),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Text(
                          _isDrawn[i] ? "สุ่มแล้ว" : "สุ่มตัวเลข",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GestureDetector(
            onTap: _saveAllDrawnNumbers,
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _isSaved ? Colors.grey : Colors.blue,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(
                _isSaved ? "บันทึกแล้ว" : "บันทึกทั้งหมด",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),

        
        
      ],
      
    );

}
}