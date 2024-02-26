import 'dart:developer';
import 'package:alikay_shop/data_models/add_to_cart_data_model.dart';
import 'package:alikay_shop/data_models/order_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddToCartController{

  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  addToCart(AddToCartDataModel addToCartDataModel){
    _firebaseFireStore.collection('addToCart').add(addToCartDataModel.toJson()).then((value){
      var id = value.id;
      _firebaseFireStore.collection('addToCart').doc(id).update({'addCartId' : id}).then((value){
        Fluttertoast.showToast(msg: 'Add To Cart Successfully');
      });
    });
  }

  removeToCart(id){
    _firebaseFireStore.collection('addToCart').doc(id).delete().then((value){
      Fluttertoast.showToast(msg: 'Successfully Remove To Cart');
    });
  }

  orderFromCart(OrderDataModel orderDataModel){
    try{
      _firebaseFireStore.collection('orderDetails').add(orderDataModel.toJson()).then((value){
        var id = value.id;
        _firebaseFireStore.collection('orderDetails').doc(id).update({'orderId' : id}).then((value){
          Fluttertoast.showToast(msg: 'Order Successfully From Cart');
          print('Order Successfully From Cart');
        });
      });
    }catch(e){
      log(e.toString());
      print(e.toString());
    }
  }

}