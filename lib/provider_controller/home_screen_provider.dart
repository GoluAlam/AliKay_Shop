// import 'package:alikay_shop/data_models/product_model.dart';
// import 'package:flutter/cupertino.dart';
// import '../controller/products_controller.dart';
//
// class HomePageProvider extends ChangeNotifier {
//   final GetProductsController _getProductsController = GetProductsController();
//   List<ProductModel> listOfProducts = [];
//   List<ProductModel> coatCategoryData = [];
//   List<ProductModel> earbudsCategoryData = [];
//
//   Future<void> getAllProducts() async {
//     listOfProducts = await _getProductsController.getProducts();
//     notifyListeners();
//   }
//
//   Future<void> getCoatCategoryData() async {
//     coatCategoryData = await _getProductsController.getCoatCategoryData();
//     notifyListeners();
//   }
//
//   Future<void> getEarbudsCategoryData() async {
//     earbudsCategoryData = await _getProductsController.getEarbudsCategoryData();
//     notifyListeners();
//   }
// }
