import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_01/config/config.dart';
import 'package:project_01/pages/login.dart';
import 'package:project_01/pages/mainPage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;

class Userprofile extends StatefulWidget {
  final int uid;

  Userprofile({super.key, required this.uid});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  String url = '';
  Map<String, dynamic> userData = {};
  TextEditingController nameCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController imageCtl = TextEditingController(); // Controller for image URL
  String image = '';

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then((config) {
      setState(() {
        url = config['apiEndpoint'];
      });
      log('API URL set to: $url');
      fetchUserData(widget.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
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
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => MainPageLotto(uid: widget.uid),
                                  transition: Transition.circularReveal,
                                  duration: const Duration(seconds: 2),
                                );
                              },
                              child: Image.asset('assets/images/angle-left.png'),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              "โปรไฟล์ของคุณ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Profile Image from URL
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: imageCtl.text.isNotEmpty
                          ? NetworkImage(imageCtl.text)
                          : const AssetImage("assets/images/profile.png")
                              as ImageProvider, // Default profile image if no URL
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Full Name Input
            buildTextField(
              label: "Fullname",
              controller: nameCtl,
              hintText: "Fullname",
            ),
            // Phone Input
            buildTextField(
              label: "Phone",
              controller: phoneCtl,
              hintText: "Phone",
            ),
            // Email Input
            buildTextField(
              label: "Email",
              controller: emailCtl,
              hintText: "Email",
            ),
            // Password Input
            buildTextField(
              label: "Password",
              controller: passwordCtl,
              hintText: "Password",
              obscureText: true,
            ),
            // Image URL Input
            buildTextField(
              label: "Image URL",
              controller: imageCtl,
              hintText: "Enter Image URL",
              onChanged: (value) {
                setState(() {
                  image = value;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigation(context),
    );
  }

  // Helper function to build text fields
  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 45,
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 100,
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(230, 230, 230, 0.965),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  obscureText: obscureText,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(163, 163, 163, 0.965),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSubmitted: (value) {
                    log("$label input value: $value");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build bottom navigation bar
  Widget buildBottomNavigation(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 216, 216),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(2.0, 2.0),
            blurRadius: 7.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              log("Logged out...");
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return buildLogoutConfirmation(context);
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(238, 78, 78, 10),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: const Text(
                  "Log out ออกจากระบบ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to display logout confirmation
  Widget buildLogoutConfirmation(BuildContext context) {
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
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "ต้องการออกจากระบบหรือไม่?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLogoutButton(
                  context: context,
                  label: "ยืนยัน",
                  color: const Color.fromARGB(255, 243, 51, 51),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'ออกจากระบบสำเร็จ!',
                    );
                  },
                ),
                buildLogoutButton(
                  context: context,
                  label: "ยกเลิก",
                  color: const Color.fromARGB(255, 110, 110, 110),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create logout confirmation buttons
  Widget buildLogoutButton({
    required BuildContext context,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> fetchUserData(int uid) async {
    if (url.isEmpty) {
      log('API URL ยังไม่ถูกตั้งค่า.');
      return;
    }

    final apiUrl = '$url/customers/$uid';
    log('ส่งคำขอ GET ไปที่: $apiUrl');

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
      );

      log('ได้รับการตอบกลับด้วยรหัสสถานะ: ${response.statusCode}');
      if (response.statusCode == 200) {
        final customersDataGetResponse = jsonDecode(response.body);
        log('ข้อมูลผู้ใช้ที่แยกออกมา: ${jsonEncode(customersDataGetResponse)}');

        setState(() {
          nameCtl.text = customersDataGetResponse['fullname'] ?? '';
          phoneCtl.text = customersDataGetResponse['phone_number'] ?? '';
          emailCtl.text = customersDataGetResponse['email'] ?? '';
          passwordCtl.text = customersDataGetResponse['password'] ?? '';
          image = customersDataGetResponse['image'] ?? '';
          imageCtl.text = image; // Update the image URL field
        });

        log("ข้อมูลผู้ใช้ได้รับการอัปเดตในสถานะแล้ว.");
      } else {
        log('คำขอล้มเหลวด้วยสถานะ: ${response.statusCode}, เนื้อหา: ${response.body}');
      }
    } catch (e) {
      log('ข้อผิดพลาดระหว่างการ fetchUserData: $e');
    }
  }
}
