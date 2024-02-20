import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String? id;
  String? type;
  String? price;
  String? size;
  String? image;
  String? fabric;
  String? name;

  ProductModel({
    this.id,
    this.type,
    this.price,
    this.size,
    this.image,
    this.fabric,
    this.name,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    type: json["Type"],
    price: json["Price"],
    size: json["Size"],
    image: json["Image"],
    fabric: json["Fabric"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Type": type,
    "Price": price,
    "Size": size,
    "Image": image,
    "Fabric": fabric,
    "Name": name,
  };
}
