import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_01/config/config.dart';
import 'package:project_01/model/customer_request.dart';
import 'package:project_01/pages/login.dart';
import 'package:http/http.dart' as http;
import 'package:project_01/pages/loginmain.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isOfflineMode = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 70),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(() => const LoginPage(),
                                transition: Transition.circularReveal,
                                duration: const Duration(seconds: 2));
                          },
                          child: Image.asset('assets/images/angle-left.png')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 191, 255, 1),
                            Color.fromARGB(255, 0, 98, 131)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: const Text(
                          'LOTTO',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 20),
              height: 40,
              child: const Text(
                'Create Your Account',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0085FF)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.topLeft,
                    child: const Text('Fullname'),
                  ),
                  Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                          controller: fullnameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: 'Fullname',
                              hintStyle: const TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0))))),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.topLeft,
                    child: const Text('Email'),
                  ),
                  Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                          controller: emailController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0))))),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.topLeft,
                    child: const Text('Phone'),
                  ),
                  Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                          controller: phoneController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: 'Phone',
                              hintStyle: const TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0))))),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.topLeft,
                    child: const Text('Password'),
                  ),
                  Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                          controller: passwordController,
                          cursorColor: Colors.black,
                          obscureText: true,
                          obscuringCharacter: '•',
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0))))),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45),
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: FilledButton(
                onPressed: () {
                  _handleSignUp();
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  backgroundColor:
                      WidgetStateProperty.all(const Color(0xFF0085FF)),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Or sign up using',
                style: TextStyle(color: Color.fromARGB(255, 165, 165, 165)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 30),
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/GGLogo.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/FBLogo.png')),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSignUp() {
    final fullname = fullnameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text;

    print('Fullname: $fullname');
    print('Email: $email');
    print('Phone: $phone');
    print('Password: $password');

    if (fullname.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบทุกช่อง')),
      );
      return;
    }

    final user = CustomerGetRequest(
      fullname: fullname,
      email: email,
      phoneNumber: phone,
      password: password,
    );

    signUp(user);
  }

  Future<void> signUp(CustomerGetRequest user) async {
    final Uri url1 = Uri.parse(
        '$url/customers/register'); // สร้าง URL สำหรับการส่งคำขอไปที่ API
    final userData = user.toJson();
    print('Sending to API: $userData');

    try {
      final response = await http.post(
        url1,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('สมัครสมาชิกสำเร็จ')),
        );

        // รอนิดหน่อยเพื่อให้ผู้ใช้เห็นข้อความ
        await Future.delayed(const Duration(seconds: 2));

        // นำทางไปยังหน้า Login โดยแทนที่หน้าปัจจุบัน
        Get.offAll(() => Loginmain());
      } else {
        var errorMessage = 'เกิดข้อผิดพลาด: ${response.statusCode}';
        if (response.body.isNotEmpty) {
          try {
            var errorBody = json.decode(response.body);
            errorMessage =
                errorBody['message'] ?? errorBody['error'] ?? errorMessage;
          } catch (e) {
            print('Error parsing error message: $e');
            errorMessage =
                response.body; // ใช้ response body ดิบถ้า parse ไม่ได้
          }
        }
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    } catch (e) {
      print('Error during sign up: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาดในการเชื่อมต่อ: $e')),
      );
    }
  }
}
