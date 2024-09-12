// To parse this JSON data, do
//
//     final customerGetRequest = customerGetRequestFromJson(jsonString);

import 'dart:convert';

CustomerGetRequest customerGetRequestFromJson(String str) => CustomerGetRequest.fromJson(json.decode(str));

String customerGetRequestToJson(CustomerGetRequest data) => json.encode(data.toJson());

class CustomerGetRequest {
    String fullname;
    String email;
    String phoneNumber;
    String password;
    

    CustomerGetRequest({
        required this.fullname,
        required this.email,
        required this.phoneNumber,
        required this.password,
        
    });

    factory CustomerGetRequest.fromJson(Map<String, dynamic> json) => CustomerGetRequest(
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        
    };
}
