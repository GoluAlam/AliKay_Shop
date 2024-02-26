import 'package:cloud_firestore/cloud_firestore.dart';

class GetProductsController{
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts()async{
    return await _firebaseFireStore.collection('products').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCoatCategoryData()async{
    return await _firebaseFireStore
        .collection('allProducts')
        .where('CategoryName', isEqualTo: 'coat')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getEarbudsCategoryData()async{
    return await _firebaseFireStore
        .collection('allProducts')
        .where('CategoryName', isEqualTo: 'earbuds')
        .get();

  }
}