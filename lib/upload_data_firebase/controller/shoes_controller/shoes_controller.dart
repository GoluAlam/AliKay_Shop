import 'dart:developer';
import 'package:alikay_shop/upload_data_firebase/data_model/man_shoes_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShoesController{
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  void womenUploadShoes(CategoryProductsDataModel manShoesDataModel) {
    _firebaseFireStore.collection('Shoes').add(manShoesDataModel.toJson()).then((value) {
      var id = value.id;
      _firebaseFireStore.collection('Shoes').doc(id).update({"shoesId": id}).then((_) {
        _firebaseFireStore.collection('Shoes').doc(id).collection('Womens').add(manShoesDataModel.toJson()).then((value) {
          var mId = value.id;
          _firebaseFireStore.collection('Shoes').doc(id).collection('Womens').doc(mId).update({"shoesId": id}).then((_) {
            Fluttertoast.showToast(msg: 'Data Uploaded Successfully');
          }).catchError((error) {
            Fluttertoast.showToast(msg: 'Failed to update women\'s shoes data: $error');
          });
        }).catchError((error) {
          Fluttertoast.showToast(msg: 'Failed to upload women\'s shoes data: $error');
        });
      }).catchError((error) {
        Fluttertoast.showToast(msg: 'Failed to update shoe document: $error');
      });
    }).catchError((error) {
      Fluttertoast.showToast(msg: 'Failed to upload shoe document: $error');
    });
  }

  kidsUploadShoes(CategoryProductsDataModel manShoesDataModel){

    _firebaseFireStore.collection('Shoes').add(manShoesDataModel.toJson()).then((value){
      Fluttertoast.showToast(msg: 'Data Uploaded Successfully');
      var id = value.id;
      _firebaseFireStore.collection('Shoes').doc(id).update({"shoesId" : id});
      _firebaseFireStore.collection('Shoes').doc(id).collection('Kids').add(manShoesDataModel.toJson()).then((value){
        var mId = value.id;
        _firebaseFireStore.collection('Shoes').doc(id).collection('Kids').doc(mId).update({"shoesId" : id});
        Fluttertoast.showToast(msg: 'Data Uploaded Successfully');
      });
    }).onError((error, stackTrace){
      Fluttertoast.showToast(msg: 'Data Uploaded Failed');
    });
  }

  mensUploadShoes(CategoryProductsDataModel manShoesDataModel){
  _firebaseFireStore.collection('Shoes').add(manShoesDataModel.toJson()).then((value){
        var id = value.id;
        _firebaseFireStore.collection('Shoes').doc(id).update({"shoesId" : id});
        _firebaseFireStore.collection('Shoes').doc(id).collection('Mens').add(manShoesDataModel.toJson()).then((value){
          var mId = value.id;
          _firebaseFireStore.collection('Shoes').doc(id).collection('Mens').doc(mId).update({"shoesId" : id});
          Fluttertoast.showToast(msg: 'Data Uploaded Successfully');
        });
      }).onError((error, stackTrace){
        Fluttertoast.showToast(msg: 'Data Uploaded Failed');
      });
}

  Future<void> addShoesToMensCategory(CategoryProductsDataModel categoryProductsDataModel)async{
    try{
      _firebaseFireStore.collection('products_categories').doc().collection('subCategory').doc().collection('mens').add(categoryProductsDataModel.toJson()).then((value){
        Fluttertoast.showToast(msg: 'Add Successfully');
      });

    }catch(e){
      log(e.toString());
    }
  }







}