import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('orderDetails').get(),
          builder: (context, snapshot) {
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
                return Card(
                  child: Column(
                    children: [
                      Image.network(data?['productsImage'] ?? 'productsImage',width: 350,height: 200,fit: BoxFit.cover,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data?['productsName'] ?? 'productsName'),
                          Text(data?['productsPrice'] ?? 'productsPrice'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data?['productsFabric'] ?? 'productsFabric'),
                          Text(data?['productsSize'] ?? 'productsSize'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data?['productsType'] ?? 'productsType'),
                          Text(data?['orderId'] ?? 'orderId')
                        ],
                      )
                    ],
                  ),
                );
                },
            );
          },
      ),
    );
  }
}
