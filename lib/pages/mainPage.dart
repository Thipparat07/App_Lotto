import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:project_01/model/LottoGetResspone.dart';
import 'package:project_01/pages/checklotto.dart';
import 'package:project_01/pages/findLotto.dart';
import 'package:project_01/pages/userProfile.dart';
import 'package:project_01/pages/wallet.dart';
import 'package:http/http.dart' as http;

class MainPageLotto extends StatefulWidget {
  int uid = 0;
  MainPageLotto({super.key, required this.uid});

  @override
  State<MainPageLotto> createState() => _MainPageLottoState();
}

class _MainPageLottoState extends State<MainPageLotto> {
  List<LottoGetResspone> lottos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLottos();
  }

  Future<void> fetchLottos() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response =
          await http.get(Uri.parse('http://192.168.56.1:3000/lotto/random'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}'); // แสดงเนื้อหาที่ได้รับจาก API

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = json.decode(response.body);
        print('JSON Map: $jsonMap'); // แสดงข้อมูล JSON ที่แปลงได้

        // สมมติว่า JSON มีคีย์ 'data' ที่เป็น List ของลอตเตอรี่
        final List<dynamic> jsonList = jsonMap['data'];
        print('JSON List: $jsonList'); // แสดงข้อมูล JSON List

        final List<LottoGetResspone> lottoList =
            jsonList.map((json) => LottoGetResspone.fromJson(json)).toList();
        print('Lotto List: $lottoList'); // แสดงรายการลอตเตอรี่ที่แปลงได้

        // สุ่มเลือก 3 รายการ
        lottoList.shuffle();
        final selectedLottos = lottoList.take(3).toList();
        print('Selected Lottos: $selectedLottos'); // แสดงลอตเตอรี่ที่เลือก

        setState(() {
          lottos = selectedLottos;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load lottos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: ${e.toString()}'); // แสดงข้อผิดพลาด
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    log('Customer id: ${widget.uid}');
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
                                              print("Account");
                                              Get.to(() => WalletPage(uid: widget.uid,),
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
                                              print("examine");
                                              Get.to(
                                                  () => checkLottoPage(uid: widget.uid,),
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
                                              print("SearchLotto...");
                                              Get.to(
                                                  () => findLottoPage(uid: widget.uid,),
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
                                              print("ProfileUser...");
                                              Get.to(() => Userprofile(uid: widget.uid,),
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
                    color: Color.fromRGBO(0, 133, 255, 10),
                  ),
                ),
              ),
            ),

            Container(
              height: 500,
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: lottos.length,
                      itemBuilder: (context, index) {
                        final lotto = lottos[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(2, 2),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(248, 199, 229, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 17,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      "เลขหน้า",
                                                      style: TextStyle(
                                                          fontSize: 11.5,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      lotto.lottoNumber
                                                          .substring(0, 3),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .grey.shade700),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      "ประเภท",
                                                      style: TextStyle(
                                                          fontSize: 11.5,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      lotto.isSold == 1
                                                          ? "ขายแล้ว"
                                                          : "ยังไม่ขาย",
                                                      style: TextStyle(
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .grey.shade700),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 2),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade400,
                                                    offset: const Offset(2, 2),
                                                    blurRadius: 4,
                                                    spreadRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                lotto.lottoNumber,
                                                style: TextStyle(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        0, 133, 255, 10)),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 35,
                                                  child: const Text(
                                                    "ราคา",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 2),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 80,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child:
                                                        Text("${lotto.price}"),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 25,
                                                  child: const Text(
                                                    "บาท",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    print("AddItem");
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 25,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/cart.png")),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Container(
            //   height: 320,
            //   child: isLoading
            //       ? Center(child: CircularProgressIndicator())
            //       : ListView.builder(
            //           itemCount: lottos.length,
            //           itemBuilder: (context, index) {
            //             final lotto = lottos[index];
            //             return Padding(
            //               padding: const EdgeInsets.symmetric(
            //                   horizontal: 20, vertical: 5),
            //               child: Container(
            //                 height: 100,
            //                 decoration: BoxDecoration(
            //                   color: Colors.grey.shade200,
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color: Colors.grey.shade400,
            //                       offset: const Offset(2, 2),
            //                       blurRadius: 4,
            //                       spreadRadius: 0,
            //                     ),
            //                   ],
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(10)),
            //                 ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(10),
            //                   child: Container(
            //                     decoration: const BoxDecoration(
            //                       color: Color.fromARGB(248, 199, 229, 255),
            //                       borderRadius:
            //                           BorderRadius.all(Radius.circular(10)),
            //                     ),
            //                     child: Row(
            //                       children: [
            //                         Expanded(
            //                           child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             children: [
            //                               Container(
            //                                 height: 17,
            //                                 child: Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment.center,
            //                                   children: [
            //                                     Container(
            //                                       alignment: Alignment.center,
            //                                       width: 37,
            //                                       child: const Text(
            //                                         "เลขหน้า",
            //                                         style: TextStyle(
            //                                             fontSize: 12,
            //                                             fontWeight:
            //                                                 FontWeight.bold),
            //                                       ),
            //                                     ),
            //                                     Container(
            //                                       alignment: Alignment.center,
            //                                       width: 35,
            //                                       child: Text(
            //                                         lotto.lottoNumber
            //                                             .substring(0, 3),
            //                                         style: TextStyle(
            //                                             fontSize: 12,
            //                                             fontWeight:
            //                                                 FontWeight.bold,
            //                                             color: Colors
            //                                                 .grey.shade700),
            //                                       ),
            //                                     ),
            //                                     Container(
            //                                       alignment: Alignment.center,
            //                                       width: 50,
            //                                       child: const Text(
            //                                         "ประเภท",
            //                                         style: TextStyle(
            //                                             fontSize: 12,
            //                                             fontWeight:
            //                                                 FontWeight.bold),
            //                                       ),
            //                                     ),
            //                                     Container(
            //                                       alignment: Alignment.center,
            //                                       child: Text(
            //                                         lotto.isSold == 1
            //                                             ? "ขายแล้ว"
            //                                             : "ยังไม่ขาย",
            //                                         style: TextStyle(
            //                                             fontSize: 12,
            //                                             fontWeight:
            //                                                 FontWeight.bold,
            //                                             color: Colors
            //                                                 .grey.shade700),
            //                                       ),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding: const EdgeInsets.symmetric(
            //                                     horizontal: 4, vertical: 2),
            //                                 child: Container(
            //                                   width: MediaQuery.of(context)
            //                                       .size
            //                                       .width,
            //                                   height: 40,
            //                                   alignment: Alignment.center,
            //                                   decoration: BoxDecoration(
            //                                     color: Colors.white,
            //                                     borderRadius:
            //                                         const BorderRadius.all(
            //                                             Radius.circular(10)),
            //                                     boxShadow: [
            //                                       BoxShadow(
            //                                         color: Colors.grey.shade400,
            //                                         offset: const Offset(2, 2),
            //                                         blurRadius: 4,
            //                                         spreadRadius: 0,
            //                                       ),
            //                                     ],
            //                                   ),
            //                                   child: Text(
            //                                     lotto.lottoNumber,
            //                                     style: TextStyle(
            //                                         fontSize: 26,
            //                                         fontWeight: FontWeight.bold,
            //                                         color: Color.fromRGBO(
            //                                             0, 133, 255, 10)),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Expanded(
            //                           child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             children: [
            //                               Container(
            //                                 child: Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Container(
            //                                       alignment: Alignment.center,
            //                                       width: 35,
            //                                       child: const Text(
            //                                         "ราคา",
            //                                         style: TextStyle(
            //                                             fontSize: 12,
            //                                             fontWeight:
            //                                                 FontWeight.bold),
            //                                       ),
            //                                     ),
            //                                     Padding(
            //                                       padding: const EdgeInsets
            //                                           .symmetric(vertical: 2),
            //                                       child: Container(
            //                                         alignment: Alignment.center,
            //                                         width: 80,
            //                                         decoration:
            //                                             const BoxDecoration(
            //                                           color: Colors.white,
            //                                           borderRadius:
            //                                               BorderRadius.all(
            //                                                   Radius.circular(
            //                                                       10)),
            //                                         ),
            //                                         child:
            //                                             Text("${lotto.price}"),
            //                                       ),
            //                                     ),
            //                                     Container(
            //                                       alignment: Alignment.center,
            //                                       width: 25,
            //                                       child: const Text(
            //                                         "บาท",
            //                                         style: TextStyle(
            //                                             fontSize: 12,
            //                                             fontWeight:
            //                                                 FontWeight.bold),
            //                                       ),
            //                                     ),
            //                                     GestureDetector(
            //                                       onTap: () {
            //                                         print("AddItem");
            //                                       },
            //                                       child: Container(
            //                                         alignment: Alignment.center,
            //                                         width: 25,
            //                                         decoration:
            //                                             const BoxDecoration(
            //                                           shape: BoxShape.circle,
            //                                           image: DecorationImage(
            //                                               image: AssetImage(
            //                                                   "assets/images/cart.png")),
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            // ),
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
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  print("ButLotto page...");
                  Get.to(() =>  findLottoPage(uid: widget.uid,),
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
                        spreadRadius: 1.0,
                      )
                    ],
                  ),
                  child: Text(
                    "ซื้อสลากกินแบ่งรัฐบาล ออนไลน์",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
