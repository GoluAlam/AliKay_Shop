import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWishLists extends StatefulWidget {
  const MyWishLists({Key? key}) : super(key: key);

  @override
  State<MyWishLists> createState() => _MyWishListsState();
}

class _MyWishListsState extends State<MyWishLists> {
  late final String _currentUserId;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    var view = AppWidgets();
    return Scaffold(
      appBar: view.appBarView(
          title: const Text('My Wishlist'),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('UsersFavoriteList').doc(_currentUserId).collection('FavoriteList').snapshots(),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No items in your wishlist'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        width: deviceWidth / 15,
                        height: deviceHeight / 10,
                        imageUrl: data['productsImage'] ?? "Image Null",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 50,right: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data['productsName'] ?? "Name Null",),
                                Text(data['productsPrice'] ?? "Price Null"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data['productsSize'] ?? "productsSize Null"),
                                Text(data['productsType'] ?? "productsType Null"),
                              ],
                            ),
                            Center(child: Text(data['productsFabric'] ?? "productsFabric Null")),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
