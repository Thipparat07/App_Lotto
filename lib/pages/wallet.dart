import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_01/config/config.dart';
import 'package:project_01/model/transactionsGetResponse.dart';
import 'package:project_01/pages/mainPage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  int uid = 0;
  WalletPage({super.key, required this.uid});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String url = '';
  int walletBalance = 0;
  List<Transaction> transactions = [];
  String image = '';

  @override
  void initState() {
    super.initState();
    getUrl();
  }

  Future<void> getUrl() async {
    try {
      var config = await Configuration.getConfig();
      setState(() {
        url = config['apiEndpoint'];
      });

      // Fetch lottos only after the URL is set correctly
      if (url.isNotEmpty) {
        await fetchLottos();
      }
    } catch (e) {
      print("Error fetching configuration: $e");
    }
  }

  Future<void> fetchLottos() async {
    if (url.isEmpty) {
      print('Error: API endpoint URL is not set.');
      return;
    }

    try {
      final response =
          await http.get(Uri.parse('$url/transactions/${widget.uid}'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          final transactionsGetResponse =
              transactionsGetResponseFromJson(response.body);
          setState(() {
            walletBalance = transactionsGetResponse.data.walletBalance;
            transactions = transactionsGetResponse.data.transactions;
            image = transactionsGetResponse.data.image;
          });
        } catch (e) {
          print('Error parsing transaction data: $e');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
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
              height: 95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            alignment: Alignment.centerLeft,
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
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "LOTTO",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 63, 121, 247)),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 210,
                decoration: BoxDecoration(
                  color: const Color(0xFF0085FF),
                  borderRadius: BorderRadius.circular(25),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: const Text("จำนวนเงินที่ใช้ได้",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                            Expanded(
                              child: Container(
                                height: 70,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    backgroundImage: (image.isNotEmpty &&
                                            Uri.tryParse(image)?.isAbsolute ==
                                                true)
                                        ? NetworkImage(image)
                                        : AssetImage(
                                                "assets/images/profile.png")
                                            as ImageProvider, // Use asset image if URL is invalid
                                    onBackgroundImageError:
                                        (exception, stackTrace) {
                                      print(
                                          'Error loading profile image: $exception');
                                    },
                                    child: image.isEmpty
                                        ? Icon(Icons.person,
                                            size: 35,
                                            color: Colors
                                                .grey) // Optional: Display icon if no image URL
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 30),
                        height: 40,
                        child: Text(
                          walletBalance
                              .toString(), // No const here since walletBalance is dynamic
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 120, 230, 10),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )),
                      child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "บัญชีของคุณ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Transcription",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0085FF),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  DateTime dateTime;
                  try {
                    dateTime = DateTime.parse(transaction.transactionDate);
                  } catch (e) {
                    dateTime = DateTime.now();
                    print('Error parsing date: $e');
                  }
                  final formattedDate =
                      DateFormat('d / MM / y H:mm:ss').format(dateTime);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              formattedDate, // Display formatted date
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      transaction.transactionType,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      transaction.amount.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: transaction.transactionType ==
                                                "Prize Payout"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
