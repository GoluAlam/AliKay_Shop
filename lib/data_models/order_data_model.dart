import 'dart:convert';

OrderDataModel orderDataModelFromJson(String str) => OrderDataModel.fromJson(json.decode(str));

String orderDataModelToJson(OrderDataModel data) => json.encode(data.toJson());

class OrderDataModel {
  String? orderId;
  String? paymentMode;
  String? paymentAmount;
  String? productsId;
  String? productsName;
  String? productsPrice;
  String? productsSize;
  String? productsFabric;
  String? productsType;
  String? productsImage;

  OrderDataModel({
    this.orderId,
    this.paymentMode,
    this.paymentAmount,
    this.productsId,
    this.productsName,
    this.productsPrice,
    this.productsSize,
    this.productsFabric,
    this.productsType,
    this.productsImage,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) => OrderDataModel(
    orderId: json["orderId"],
    paymentMode: json["paymentMode"],
    paymentAmount: json["paymentAmount"],
    productsId: json["productsId"],
    productsName: json["productsName"],
    productsPrice: json["productsPrice"],
    productsSize: json["productsSize"],
    productsFabric: json["productsFabric"],
    productsType: json["productsType"],
    productsImage: json["productsImage"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "paymentMode": paymentMode,
    "paymentAmount": paymentAmount,
    "productsId": productsId,
    "productsName": productsName,
    "productsPrice": productsPrice,
    "productsSize": productsSize,
    "productsFabric": productsFabric,
    "productsType": productsType,
    "productsImage": productsImage,
  };
}
