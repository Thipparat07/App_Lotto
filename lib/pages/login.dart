import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_01/pages/loginmain.dart';
import 'package:project_01/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 125,
                // color: Colors.cyan,
                // padding: const EdgeInsets.only(top: 20),
                // child: const Text('Hello world'),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 75,
                // color: Color.fromARGB(255, 255, 33, 33),
                child: const Text(
                  'Welcome To',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, fontFamily: 'Aleo'),
                ),
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                // color: const Color.fromARGB(255, 100, 255, 48),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF00BFFF),
                      Color.fromARGB(255, 0, 98, 131)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    'LOTTO',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.white, // ใช้สีใดก็ได้เพื่อให้ข้อความไม่ใช่สีดำ
                          fontFamily: 'Aleo'
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 50,
                // color: Colors.amber,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('แอปพิลเคชั่น ซื้อ-ขาย ลอตเตอรี่ หวย ออนไลน์',
                        style:
                            TextStyle(color: Color.fromARGB(255, 68, 68, 68))),
                    Text('ที่อาจจะถูกกฎหมาย',
                        style:
                            TextStyle(color: Color.fromARGB(255, 68, 68, 68)))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 55),
                height: 120,
                // color: Colors.blue,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('คำเตือน:การพนันอาจก่อให้เกิดการเสพติด'),
                    Text('และสูญเสียทางการเงิน'),
                    Text('โปรดเล่นอย่างมีสติและรับผิดชอบ')
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 75),
                width: 300,
                height: 40,
                // color: Colors.purple[100],
                child: FilledButton(
                  onPressed: () {
                    Get.to(() => const Loginmain(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 2));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Colors.blue[600]), // เปลี่ยนสีพื้นหลัง
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // ทำให้ขอบมน
                      ),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 19, color: Colors.white), // สีของข้อความ
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 300,
                height: 40,
                // color: Colors.purple[100],
                child: FilledButton(
                  onPressed: () {
                    Get.to(() => const RegisterPage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 2));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 186, 188, 210)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 30,
                margin: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 50),
                        color: const Color.fromARGB(255, 165, 165, 165),
                        height: 1.2,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Text('or'),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 50),
                        color: const Color.fromARGB(255, 165, 165, 165),
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 30),
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
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
            ]),
      ),
    );
  }
}
