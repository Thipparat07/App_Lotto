// To parse this JSON data, do
//
//     final lottoGetResspone = lottoGetRessponeFromJson(jsonString);

import 'dart:convert';

LottoGetResspone lottoGetRessponeFromJson(String str) => LottoGetResspone.fromJson(json.decode(str));

String lottoGetRessponeToJson(LottoGetResspone data) => json.encode(data.toJson());

class LottoGetResspone {
    String lottoNumber;
    int isSold;
    int isClaimed;
    int price;

    LottoGetResspone({
        required this.lottoNumber,
        required this.isSold,
        required this.isClaimed,
        required this.price,
    });

    factory LottoGetResspone.fromJson(Map<String, dynamic> json) => LottoGetResspone(
        lottoNumber: json["lotto_number"],
        isSold: json["is_sold"],
        isClaimed: json["is_claimed"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "lotto_number": lottoNumber,
        "is_sold": isSold,
        "is_claimed": isClaimed,
        "price": price,
    };
}
