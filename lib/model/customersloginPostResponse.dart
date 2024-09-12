// To parse this JSON data, do
//
//     final customersloginPostResponse = customersloginPostResponseFromJson(jsonString);

import 'dart:convert';

CustomersloginPostResponse customersloginPostResponseFromJson(String str) => CustomersloginPostResponse.fromJson(json.decode(str));

String customersloginPostResponseToJson(CustomersloginPostResponse data) => json.encode(data.toJson());

class CustomersloginPostResponse {
    String message;
    int userId;
    int status;

    CustomersloginPostResponse({
        required this.message,
        required this.userId,
        required this.status,
    });

    factory CustomersloginPostResponse.fromJson(Map<String, dynamic> json) => CustomersloginPostResponse(
        message: json["message"],
        userId: json["userID"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "userID": userId,
        "status": status,
    };
}
