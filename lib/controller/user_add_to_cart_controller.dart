import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../data_models/add_to_cart_data_model.dart';

class UserAddToCartController{
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final _currentUserId = FirebaseAuth.instance.currentUser?.uid;

  userAddToCart(AddToCartDataModel addToCartDataModel){
    if(_currentUserId != null){
      _firebaseFireStore.collection('UserAddToCart').doc(_currentUserId).collection('addToCart').add(addToCartDataModel.toJson()).then((value){
        var id = value.id;
        _firebaseFireStore.collection('UserAddToCart').doc(_currentUserId).collection('addToCart').doc(id).update({'addCartId' : id}).then((value){
          Fluttertoast.showToast(msg: 'User Add To Cart Successfully');
        });
      });
    }
  }

  removeToCart(id){
    _firebaseFireStore.collection('UserAddToCart').doc(_currentUserId).collection('addToCart').doc(id).delete().then((value){
      Fluttertoast.showToast(msg: 'Successfully Remove To Cart');
    });
  }

}