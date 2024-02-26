import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../controller/user_order_controller.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final UserOrdersController _userOrdersController = UserOrdersController();
  var userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.blue,),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('UsersOrder')
            .doc(userId)
            .collection('orders')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If data is available
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final orderData = documents[index].data() as Map<String, dynamic>;
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      orderData['productsImage'] ?? 'productsImage',
                      width: 350,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(orderData['productsName'] ?? 'productsName'),
                        Text(orderData['productsPrice'] ?? 'productsPrice'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(orderData['productsFabric'] ?? 'productsFabric'),
                        Text(orderData['productsSize'] ?? 'productsSize'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(orderData['productsType'] ?? 'productsType'),
                        Text(orderData['orderId'] ?? 'orderId')
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
