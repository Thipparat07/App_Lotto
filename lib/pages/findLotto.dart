import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/config/config.dart';
import 'package:project_01/pages/buyhistory.dart';
import 'package:project_01/pages/lottoList.dart';
import 'package:project_01/pages/mainPage.dart';

class findLottoPage extends StatefulWidget {
  int uid = 0;
  findLottoPage({super.key, required this.uid});

  @override
  State<findLottoPage> createState() => _findLottoPageState();
}

class _findLottoPageState extends State<findLottoPage> {
  List<TextEditingController> _controllers = [];
  List<dynamic>? searchResults;
  bool isLoading = false;
  String searchType = 'full';
  String url = '';

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (config) {
        url = config['apiEndpoint'] ?? '';
      },
    );
    _initializeControllers();
  }

  @override
void dispose() {
  for (var controller in _controllers) {
    controller.dispose();
  }
  super.dispose();
}


Future<void> addToBasket(String lottoNumber, int price) async {
  try {
    final url1 = Uri.parse('$url/basket/add');
    final response = await http.post(
      url1,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'lotto_id': lottoNumber,
        'price': price,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully added to basket
      print('Added to basket');
    } else {
      // Handle errors
      print('Failed to add to basket: ${response.body}');
    }
  } catch (e) {
    // Handle network errors
    print('Error: $e');
  }
}

  void _initializeControllers() {
    _controllers = List.generate(6, (_) => TextEditingController());
  }

  Future<void> searchLottery(String numbers, String type) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http
          .get(Uri.parse('$url/lotto/search?number=$numbers&type=$type'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success']) {
          setState(() {
            searchResults = jsonResponse['data'];
          });
        } else {
          setState(() {
            searchResults = [];
          });
        }
      } else {
        throw Exception('Failed to load lottery data');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('เกิดข้อผิดพลาดในการค้นหา กรุณาลองใหม่อีกครั้ง')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> generateRandomNumber() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response =
          await http.get(Uri.parse('$url/lotto/random-lotto?type=$searchType'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success']) {
          String randomNumber = jsonResponse['data']['lotto_number'];
          setState(() {
            if (searchType == 'front') {
              randomNumber = randomNumber.substring(0, 3);
            } else if (searchType == 'back') {
              randomNumber = randomNumber.substring(randomNumber.length - 3);
            }
            // Clear all fields first
            clearFields();
            // Then fill with the new random number
            for (int i = 0; i < randomNumber.length; i++) {
              _controllers[i].text = randomNumber[i];
            }
          });
        } else {
          throw Exception('Failed to get random number');
        }
      } else {
        throw Exception('Failed to load random number');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('เกิดข้อผิดพลาดในการสุ่มตัวเลข กรุณาลองใหม่อีกครั้ง')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void findNum() {
    int fieldsToUse = searchType == 'full' ? 6 : 3;
    String combinedString = _controllers
        .take(fieldsToUse)
        .map((controller) => controller.text)
        .join('');
    if (combinedString.length == fieldsToUse) {
      searchLottery(combinedString, searchType);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณากรอกตัวเลขให้ครบ ${fieldsToUse} หลัก')),
      );
    }
  }

  void clearFields() {
    for (var controller in _controllers) {
      controller.clear();
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
                                  log("Back to...");
                                  Get.to(
                                      () => MainPageLotto(
                                            uid: widget.uid,
                                          ),
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
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Welcome To ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(" LOTTO",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 2), // ย้ายเงาเฉพาะในแนวดิ่ง
                      blurRadius: 3, // เบลอเงา
                      spreadRadius: 0, // ไม่มีการขยายเงา
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                  Get.to(
                                      () => lottoListPage(
                                            uid: widget.uid,
                                          ),
                                      transition: Transition.circularReveal,
                                      duration: const Duration(seconds: 2));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 1),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(0, 175, 12, 10),
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
                                    child: const Text(
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
                                  Get.to(
                                      () => buyHistoryPage(
                                            uid: widget.uid,
                                          ),
                                      transition: Transition.circularReveal,
                                      duration: const Duration(seconds: 2));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
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
                                    child: const Text(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(searchType == 'full' ? 6 : 3,
                              (index) {
                            return Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.symmetric(horizontal: 7.5),
                              child: TextField(
                                controller: _controllers[index],
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      width: 2.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      index < (searchType == 'full' ? 5 : 2)) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (value.isEmpty && index > 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 'front',
                            groupValue: searchType,
                            onChanged: (value) {
                              setState(() {
                                searchType = value.toString();
                                clearFields();
                              });
                            },
                          ),
                          Text('3 ตัวหน้า'),
                          Radio(
                            value: 'back',
                            groupValue: searchType,
                            onChanged: (value) {
                              setState(() {
                                searchType = value.toString();
                                clearFields();
                              });
                            },
                          ),
                          Text('3 ตัวหลัง'),
                          Radio(
                            value: 'full',
                            groupValue: searchType,
                            onChanged: (value) {
                              setState(() {
                                searchType = value.toString();
                                clearFields();
                              });
                            },
                          ),
                          Text('เลขทั้งหมด'),
                        ],
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: generateRandomNumber,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 7),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                217, 217, 217, 10),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade600,
                                                offset: const Offset(2, 2),
                                                blurRadius: 2,
                                                spreadRadius: 0,
                                              ),
                                            ],
                                          ),
                                          child: Text("สุ่มตัวเลข",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: clearFields,
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
                                                offset: const Offset(2, 2),
                                                blurRadius: 2,
                                                spreadRadius: 0,
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                          offset: const Offset(2, 2),
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "ค้นหา",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 40,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "ผลการค้นหา",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: searchResults != null ? 300 : 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(248, 199, 229, 255),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: isLoading
    ? const Center(child: CircularProgressIndicator())
    : searchResults != null
        ? searchResults!.isEmpty
            ? const Center(child: Text('ไม่พบสลากที่ตรงกับเงื่อนไขการค้นหา'))
            : ListView.builder(
                itemCount: searchResults!.length,
                itemBuilder: (context, index) {
                  final lotto = searchResults![index];
                  bool _isButtonDisabled = false;

                  return ListTile(
                    title: Text('เลขที่: ${lotto['lotto_id']}'),
                    subtitle: Text('ราคา: ${lotto['price']} บาท'),
                    trailing: ElevatedButton(
                      child: const Text('เพิ่มลงตะกร้า'),
                      onPressed: _isButtonDisabled
                          ? null
                          : () async {
                              setState(() {
                                _isButtonDisabled = true;
                              });
                              final lottoNumber = lotto['lotto_id'];
                              final price = lotto['price'];
                              final response = await addToBasket(lottoNumber, price);
                              setState(() {
                                _isButtonDisabled = false;
                              });

                              // if () {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text('Item added to basket')),
                              //   );
                              // } else {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text('Failed to add item')),
                              //   );
                              // }
                            },
                    ),
                  );
                },
              )
        : const Center(child: Text('กรุณากรอกเลขที่ต้องการค้นหา')),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
