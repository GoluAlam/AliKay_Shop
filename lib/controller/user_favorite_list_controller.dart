import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data_models/add_into_favorite.dart';

class UserFavoriteListController{
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final _currentUserId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> userAddFavoriteList(AddFavouritesDataModel addFavouritesDataModel)async{
    _firebaseFireStore.collection('UsersFavoriteList').doc(_currentUserId).collection('FavoriteList').add(addFavouritesDataModel.toJson()).then((value){
      var id = value.id;
      _firebaseFireStore.collection('UsersFavoriteList').doc(_currentUserId).collection('FavoriteList').doc(id).update({'addCartId' : id}).then((value){
        Fluttertoast.showToast(msg: 'Add Favorite Successfully');
      });
    });

  }

  Future<void> userRemoveFromFavoriteList(id)async{
    _firebaseFireStore.collection('UsersFavoriteList').doc(_currentUserId).collection('FavoriteList').doc(id).delete().then((value){
      Fluttertoast.showToast(msg: 'Delete Favorite Successful');
    });

  }
}