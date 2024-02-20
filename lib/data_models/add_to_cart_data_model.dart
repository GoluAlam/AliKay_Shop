import 'dart:convert';

AddToCartDataModel addToCartDataModelFromJson(String str) => AddToCartDataModel.fromJson(json.decode(str));

String addToCartDataModelToJson(AddToCartDataModel data) => json.encode(data.toJson());

class AddToCartDataModel {
  String? addCartId;
  String? productsName;
  String? productsPrice;
  String? productsSize;
  String? productsFabric;
  String? productsType;
  String? productsImage;

  AddToCartDataModel({
    this.addCartId,
    this.productsName,
    this.productsPrice,
    this.productsSize,
    this.productsFabric,
    this.productsType,
    this.productsImage,
  });

  factory AddToCartDataModel.fromJson(Map<String, dynamic> json) => AddToCartDataModel(
    addCartId: json["addCartId"],
    productsName: json["productsName"],
    productsPrice: json["productsPrice"],
    productsSize: json["productsSize"],
    productsFabric: json["productsFabric"],
    productsType: json["productsType"],
    productsImage: json["productsImage"],
  );

  Map<String, dynamic> toJson() => {
    "addCartId": addCartId,
    "productsName": productsName,
    "productsPrice": productsPrice,
    "productsSize": productsSize,
    "productsFabric": productsFabric,
    "productsType": productsType,
    "productsImage": productsImage,
  };
}
