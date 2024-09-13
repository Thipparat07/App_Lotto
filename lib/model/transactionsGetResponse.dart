// To parse this JSON data, do
//
//     final transactionsGetResponse = transactionsGetResponseFromJson(jsonString);

import 'dart:convert';

TransactionsGetResponse transactionsGetResponseFromJson(String str) => TransactionsGetResponse.fromJson(json.decode(str));

String transactionsGetResponseToJson(TransactionsGetResponse data) => json.encode(data.toJson());

class TransactionsGetResponse {
    bool success;
    String message;
    Data data;

    TransactionsGetResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory TransactionsGetResponse.fromJson(Map<String, dynamic> json) => TransactionsGetResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int walletBalance;
    String image;
    List<Transaction> transactions;

    Data({
        required this.walletBalance,
        required this.image,
        required this.transactions,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        walletBalance: json["wallet_balance"],
        image: json["image"],
        transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "wallet_balance": walletBalance,
        "image": image,
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
    };
}

class Transaction {
    int transactionId;
    int userId;
    int amount;
    String transactionType;
    String transactionDate;

    Transaction({
        required this.transactionId,
        required this.userId,
        required this.amount,
        required this.transactionType,
        required this.transactionDate,
    });

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        amount: json["amount"],
        transactionType: json["transaction_type"],
        transactionDate: json["transaction_date"],
    );

    Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "user_id": userId,
        "amount": amount,
        "transaction_type": transactionType,
        "transaction_date": transactionDate,
    };
}
