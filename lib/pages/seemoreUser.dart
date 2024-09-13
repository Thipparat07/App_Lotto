// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:project_01/pages/userList.dart';
// import 'package:quickalert/quickalert.dart';

// class seeUserPage extends StatefulWidget {
//   final int userId;

//   const seeUserPage({Key? key, required this.userId}) : super(key: key);

//   @override
//   State<seeUserPage> createState() => _seeUserPageState();
// }

// class _seeUserPageState extends State<seeUserPage> {
//   bool isLoading = true;
//   String errorMessage = '';
//   Map<String, dynamic> userData = {};
  
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController fullnameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = '';
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://app-lotto-api.onrender.com/admin/user/${widget.userId}')
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> jsonResponse = json.decode(response.body);
//         if (jsonResponse['success'] == true) {
//           setState(() {
//             userData = jsonResponse['data'];
//             usernameController.text = userData['username'] ?? '';
//             fullnameController.text = userData['fullname'] ?? '';
//             phoneController.text = userData['phone_number'] ?? '';
//             emailController.text = userData['email'] ?? '';
//             isLoading = false;
//           });
//         } else {
//           throw Exception('Failed to load user data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception('Failed to load user data');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//         errorMessage = 'เกิดข้อผิดพลาดในการโหลดข้อมูล: $e';
//       });
//       log('Error fetching user data: $e');
//     }
//   }

//   Future<void> updateUserData() async {
//     try {
//       final response = await http.put(
//         Uri.parse('https://app-lotto-api.onrender.com/admin/update-user/${widget.userId}'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode({
//           'username': usernameController.text,
//           'fullname': fullnameController.text,
//           'phone_number': phoneController.text,
//           'email': emailController.text,
//           'password': passwordController.text,
//         }),
//       );

//       if (response.statusCode == 200) {
//         showAlert("อัปเดตข้อมูลผู้ใช้สำเร็จ");
//       } else {
//         throw Exception('Failed to update user data');
//       }
//     } catch (e) {
//       showAlert("เกิดข้อผิดพลาดในการอัปเดตข้อมูล: $e", QuickAlertType.error);
//     }
//   }

//   Future<void> deleteUser() async {
//     try {
//       final response = await http.delete(
//         Uri.parse('https://app-lotto-api.onrender.com/admin/delete-user/${widget.userId}')
//       );

//       if (response.statusCode == 200) {
//         showAlert("ลบข้อมูลผู้ใช้สำเร็จ");
//         Get.to(() => userListPage(uid:widget.uid),
//             transition: Transition.fadeIn,
//             duration: const Duration(seconds: 2));
//       } else {
//         throw Exception('Failed to delete user');
//       }
//     } catch (e) {
//       showAlert("เกิดข้อผิดพลาดในการลบข้อมูล: $e", QuickAlertType.error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : errorMessage.isNotEmpty
//               ? Center(child: Text(errorMessage))
//               : SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       // Header
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 250,
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF0085FF),
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(25),
//                             bottomRight: Radius.circular(25),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade500,
//                               offset: const Offset(2.0, 2.0),
//                               blurRadius: 7.0,
//                               spreadRadius: 1.0,
//                             )
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             SizedBox(height: 60),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 10),
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                     icon: Image.asset('assets/images/angle-left.png'),
//                                     onPressed: () => Get.back(),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       "โปรไฟล์ของคุณผู้ใช้งานระบบ",
//                                       textAlign: TextAlign.right,
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             CircleAvatar(
//                               radius: 60,
//                               backgroundColor: Colors.white,
//                               backgroundImage: AssetImage("assets/images/profile.png"),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 50),
//                       // Form fields
//                       buildTextField("Username", usernameController),
//                       buildTextField("Fullname", fullnameController),
//                       buildTextField("Phone", phoneController),
//                       buildTextField("Email", emailController),
//                       buildTextField("Password", passwordController, isPassword: true),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: updateUserData,
//                         child: Text("อัปเดตข้อมูล"),
//                       ),
//                     ],
//                   ),
//                 ),
//       bottomNavigationBar: Container(
//         height: 90,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 216, 216, 216),
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade500,
//               offset: const Offset(2.0, 2.0),
//               blurRadius: 7.0,
//               spreadRadius: 1.0,
//             )
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () => showDeleteConfirmation(context),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Color.fromRGBO(238, 78, 78, 10),
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade500,
//                         offset: const Offset(2.0, 2.0),
//                         blurRadius: 3.0,
//                         spreadRadius: 1.0,
//                       )
//                     ],
//                   ),
//                   child: Text(
//                     "ลบผู้ใช้นี้ออกจากระบบ",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Row(
//         children: [
//           Container(
//             alignment: Alignment.centerLeft,
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(230, 230, 230, 0.965),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextField(
//                 controller: controller,
//                 obscureText: isPassword,
//                 textAlign: TextAlign.center,
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: label,
//                   hintStyle: TextStyle(
//                     fontSize: 16,
//                     color: Color.fromRGBO(163, 163, 163, 0.965),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void showDeleteConfirmation(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 250,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade400,
//                 offset: const Offset(2.0, 2.0),
//                 blurRadius: 7.0,
//                 spreadRadius: 1.0,
//               )
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "ยืนยันการลบผู้ใช้นี้ออกจากระบบ?",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: const Color.fromARGB(255, 220, 49, 49),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "ข้อมูลของผู้ใช้ทั้งหมดจะหายไป",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: const Color.fromARGB(255, 220, 49, 49),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text("ยกเลิก"),
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       deleteUser();
//                     },
//                     child: Text("ยืนยัน"),
//                     style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(238, 78, 78, 10)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void showAlert(String message, [QuickAlertType type = QuickAlertType.success]) {
//     QuickAlert.show(
//       context: context,
//       title: message,
//       type: type,
//     );
//   }
// }