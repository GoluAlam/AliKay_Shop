import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataWithCategory extends StatefulWidget {
  const GetDataWithCategory({super.key});

  @override
  State<GetDataWithCategory> createState() => _GetDataWithCategoryState();
}

class _GetDataWithCategoryState extends State<GetDataWithCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      FutureBuilder(
        future: FirebaseFirestore.instance.collection('allProducts').where('coat').get(),
        builder: (context,snapshot) {  
          if(snapshot.hasError){
            return const Text('Something went wrong');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
              var data = snapshot.data?.docs[index];
              return Column(
                children: [
                  Image.network(data?['productsImage'] ?? "Image Null"),
                  Text(data?['productsDesc'] ?? "Desc Null"),
                  Text(data?['productsName'] ?? "Name Null"),
                  Text(data?['productsPrice'] ?? "Price Null"),
                  Text(data?['productsSize'] ?? "Size Null"),
                  Text(data?['categoryId'] ?? "CategoryId Null"),
                  Text(data?['productsId'] ?? "ProductsId Null"),

                ],
              );
                
              },
          );
        },),
    );
  }
}
