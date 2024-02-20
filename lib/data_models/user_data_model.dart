import 'dart:convert';

UsersDetailsDataModel usersDetailsDataModelFromJson(String str) => UsersDetailsDataModel.fromJson(json.decode(str));

String usersDetailsDataModelToJson(UsersDetailsDataModel data) => json.encode(data.toJson());

class UsersDetailsDataModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhoneNumber;

  UsersDetailsDataModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPhoneNumber,
  });

  factory UsersDetailsDataModel.fromJson(Map<String, dynamic> json) => UsersDetailsDataModel(
    userId: json["userId"],
    userName: json["userName"],
    userEmail: json["userEmail"],
    userPhoneNumber: json["userPhoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userName": userName,
    "userEmail": userEmail,
    "userPhoneNumber": userPhoneNumber,
  };
}
