// To parse this JSON data, do
//
//     final basketGetResponse = basketGetResponseFromJson(jsonString);

import 'dart:convert';

BasketGetResponse basketGetResponseFromJson(String str) => BasketGetResponse.fromJson(json.decode(str));

String basketGetResponseToJson(BasketGetResponse data) => json.encode(data.toJson());

class BasketGetResponse {
    bool success;
    String message;
    List<Datum> data;
    String totalAmount;

    BasketGetResponse({
        required this.success,
        required this.message,
        required this.data,
        required this.totalAmount,
    });

    factory BasketGetResponse.fromJson(Map<String, dynamic> json) => BasketGetResponse(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalAmount: json["totalAmount"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalAmount": totalAmount,
    };
}

class Datum {
    int basketId;
    int lottoId;
    int quantity;
    String lottoNumber;
    int price;
    int itemTotal;

    Datum({
        required this.basketId,
        required this.lottoId,
        required this.quantity,
        required this.lottoNumber,
        required this.price,
        required this.itemTotal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        basketId: json["basket_id"],
        lottoId: json["lotto_id"],
        quantity: json["quantity"],
        lottoNumber: json["lotto_number"],
        price: json["price"],
        itemTotal: json["itemTotal"],
    );

    Map<String, dynamic> toJson() => {
        "basket_id": basketId,
        "lotto_id": lottoId,
        "quantity": quantity,
        "lotto_number": lottoNumber,
        "price": price,
        "itemTotal": itemTotal,
    };
}
