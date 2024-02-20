import 'package:alikay_shop/data_models/add_into_favorite.dart';
import 'package:alikay_shop/data_models/order_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderController{

  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  orderPaymentDetails(OrderDataModel orderDataModel){
    _firebaseFireStore.collection('orderDetails').add(orderDataModel.toJson()).then((value){
      var id = value.id;
      _firebaseFireStore.collection('orderDetails').doc(id).update({'orderId': id}).then((value){
        Fluttertoast.showToast(msg: 'Order Payment Successfully');
      });
    });
  }

  addIntoFavorite(AddFavouritesDataModel addFavouritesDataModel){
    _firebaseFireStore.collection('addIntoFavorites').add(addFavouritesDataModel.toJson()).then((value){
      var id = value.id;
      _firebaseFireStore.collection('addIntoFavorites').doc(id).update({'addFavoriteId' : id}).then((value){
        Fluttertoast.showToast(msg: 'Add Into Favorite Successfully');
      });
    });

  }
}