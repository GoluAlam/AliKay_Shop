import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../data_models/order_data_model.dart';

class UserOrdersController {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  void orderPaymentDetails(OrderDataModel orderDataModel) {
    if (_currentUser != null) {
      String orderId = _currentUser!.uid;
      _firebaseFireStore.collection('UsersOrder').doc(orderId).collection('orders').add(orderDataModel.toJson()).then((value) {
        String id = value.id;
        _firebaseFireStore.collection('UsersOrder').doc(orderId).collection('orders').doc(id).update({'orderId': id}).then((value) {
          Fluttertoast.showToast(msg: 'User Order Payment Successful');
        });
      });
    } else {
      Fluttertoast.showToast(msg: 'User not logged in');
    }
  }


}
