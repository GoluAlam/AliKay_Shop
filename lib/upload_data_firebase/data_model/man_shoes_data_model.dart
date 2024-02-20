import 'dart:convert';

List<CategoryProductsDataModel> uploadShoesDataModelFromJson(String str) => List<CategoryProductsDataModel>.from(json.decode(str).map((x) => CategoryProductsDataModel.fromJson(x)));

String uploadShoesDataModelToJson(List<CategoryProductsDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryProductsDataModel {
  String? shoesId;
  String? category;
  String? shoesName;
  String? shoesPrice;
  String? shoesSize;
  String? shoesColor;
  String? shoesBrand;
  String? shoesMaterial;

  CategoryProductsDataModel({
    this.shoesId,
    this.category,
    this.shoesName,
    this.shoesPrice,
    this.shoesSize,
    this.shoesColor,
    this.shoesBrand,
    this.shoesMaterial,
  });

  factory CategoryProductsDataModel.fromJson(Map<String, dynamic> json) => CategoryProductsDataModel(
    shoesId: json["shoesId"],
    category: json["category"],
    shoesName: json["shoesName"],
    shoesPrice: json["shoesPrice"],
    shoesSize: json["shoesSize"],
    shoesColor: json["shoesColor"],
    shoesBrand: json["shoesBrand"],
    shoesMaterial: json["shoesMaterial"],
  );

  Map<String, dynamic> toJson() => {
    "shoesId": shoesId,
    "category": category,
    "shoesName": shoesName,
    "shoesPrice": shoesPrice,
    "shoesSize": shoesSize,
    "shoesColor": shoesColor,
    "shoesBrand": shoesBrand,
    "shoesMaterial": shoesMaterial,
  };
}
