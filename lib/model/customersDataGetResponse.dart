// To parse this JSON data, do
//
//     final customersDataGetResponse = customersDataGetResponseFromJson(jsonString);

import 'dart:convert';

CustomersDataGetResponse customersDataGetResponseFromJson(String str) => CustomersDataGetResponse.fromJson(json.decode(str));

String customersDataGetResponseToJson(CustomersDataGetResponse data) => json.encode(data.toJson());

class CustomersDataGetResponse {
    int userId;
    String fullname;
    String email;
    String password;
    String phoneNumber;
    int status;
    int walletBalance;
    String image;

    CustomersDataGetResponse({
        required this.userId,
        required this.fullname,
        required this.email,
        required this.password,
        required this.phoneNumber,
        required this.status,
        required this.walletBalance,
        required this.image,
    });

    factory CustomersDataGetResponse.fromJson(Map<String, dynamic> json) => CustomersDataGetResponse(
        userId: json["user_id"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        walletBalance: json["wallet_balance"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
        "status": status,
        "wallet_balance": walletBalance,
        "image": image,
    };
}
