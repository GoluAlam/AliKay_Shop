import 'dart:convert';

AddFavouritesDataModel addFavouritesDataModelFromJson(String str) => AddFavouritesDataModel.fromJson(json.decode(str));

String addFavouritesDataModelToJson(AddFavouritesDataModel data) => json.encode(data.toJson());

class AddFavouritesDataModel {
  String? addFavoriteId;
  bool? isFavorite;
  String? productsName;
  String? productsPrice;
  String? productsSize;
  String? productsFabric;
  String? productsType;
  String? productsImage;

  AddFavouritesDataModel({
    this.addFavoriteId,
    this.isFavorite,
    this.productsName,
    this.productsPrice,
    this.productsSize,
    this.productsFabric,
    this.productsType,
    this.productsImage,
  });

  factory AddFavouritesDataModel.fromJson(Map<String, dynamic> json) => AddFavouritesDataModel(
    addFavoriteId: json["addFavoriteId"],
    isFavorite: json["isFavorite"],
    productsName: json["productsName"],
    productsPrice: json["productsPrice"],
    productsSize: json["productsSize"],
    productsFabric: json["productsFabric"],
    productsType: json["productsType"],
    productsImage: json["productsImage"],
  );

  Map<String, dynamic> toJson() => {
    "addFavoriteId": addFavoriteId,
    "isFavorite": isFavorite,
    "productsName": productsName,
    "productsPrice": productsPrice,
    "productsSize": productsSize,
    "productsFabric": productsFabric,
    "productsType": productsType,
    "productsImage": productsImage,
  };
}
