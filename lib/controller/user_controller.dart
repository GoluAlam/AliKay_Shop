import 'package:alikay_shop/data_models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserController{

  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  addUsersDetails(UsersDetailsDataModel usersDetailsDataModel){
    _firebaseFireStore.collection('usersDetails').doc(currentUser).set(usersDetailsDataModel.toJson()).then((value){
      Fluttertoast.showToast(msg: 'Data Insert Successfully');
    }).catchError((error){
      Fluttertoast.showToast(msg: 'Failed');
    });
  }

  userUpdateProfile(UsersDetailsDataModel usersDetailsDataModel){
    _firebaseFireStore.collection('usersDetails').doc(currentUser).update({
      "userName" : usersDetailsDataModel.userName
    }).then((value){
      Fluttertoast.showToast(msg: 'Data Updated Successfully');
    });

  }

}