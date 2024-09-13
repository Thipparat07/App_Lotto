import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  String username = '';
  late UserProfile user;
}

class UserProfile {
  String uid ='';
  String status = '';
}