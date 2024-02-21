import 'package:alikay_shop/controller/add_to_cart_controller.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../controller/order_controller.dart';
import '../../data_models/order_data_model.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  var data;

  final AddToCartController _addToCartController = AddToCartController();
  final Razorpay _razorPay = Razorpay();
  final OrderController _orderController = OrderController();

  TextEditingController productsName = TextEditingController();
  TextEditingController productsPrice = TextEditingController();
  TextEditingController productsSize = TextEditingController();
  TextEditingController productsType = TextEditingController();
  TextEditingController productsFabric = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorPay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Successfully');
    Fluttertoast.showToast(
      msg: 'Payment Successfully',
      gravity: ToastGravity.BOTTOM_LEFT,
      fontSize: 40,
      textColor: Colors.green,
    );
    _orderController.orderPaymentDetails(OrderDataModel(
      paymentAmount: data['productsPrice'],
      productsImage: data['productsImage'],
      productsName: data['productsName'],
      productsFabric: data['productsFabric'],
      productsSize: data['productsSize'],
      productsPrice: data['productsPrice'],
      productsType: data['productsType'],
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment failed');
    Fluttertoast.showToast(
      msg: 'Payment Failed',
      gravity: ToastGravity.BOTTOM_LEFT,
      fontSize: 40,
      textColor: Colors.red,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('Payment Successfully with Wallet');
    Fluttertoast.showToast(
      msg: 'Payment Successfully with Wallet',
      gravity: ToastGravity.BOTTOM_LEFT,
      fontSize: 40,
      textColor: Colors.green,
    );
  }

  void payOrderAmount(amount) {
    var options = {
      'key': 'rzp_test_8q9EoCx5zdsxNX',
      'amount': (int.parse(amount.text) * 100).toString(),
      'name': 'Ali',
      'description': 'Description for payment',
      'timeout': 60,
      'prefill': {
        'contact': '8235266260',
        'email': 'ali@gmail.com',
      }
    };
    _razorPay.open(options);
    print(amount);
  }

  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Add To Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('addToCart').get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              data = snapshot.data!.docs[index];
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      data['productsImage'] ?? "Null Data",
                      width: 350,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Text(data['productsName'] ?? "Null Data"),
                    Text(data['productsPrice'] ?? "Null Data"),
                    Text(data['productsSize'] ?? "Null Data"),
                    Text(data['productsType'] ?? "Null Data"),
                    Text(data['productsFabric'] ?? "Null Data"),
                    Text(data['addCartId'] ?? "Null Data"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        view.elevatedButton('Remove', onPressed: () {
                          _addToCartController.removeToCart(data['addCartId']);
                        }),
                        view.elevatedButton('Buy now', onPressed: () {
                          view.bottomSheet(
                            context: context,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    view.sizedBox(height: 25),
                                    view.textFormField(
                                      controller: TextEditingController(
                                          text: data['productsName'] ?? ""),
                                      labelText: 'Products Desc',
                                      enabled: false,
                                    ),
                                    view.sizedBox(height: 15),
                                    view.textFormField(
                                      controller: TextEditingController(
                                          text: data['productsPrice']),
                                      labelText: 'Products Price',
                                      enabled: false,
                                    ),
                                    view.sizedBox(height: 15),
                                    view.textFormField(
                                      controller: TextEditingController(
                                          text: data['productsFabric']),
                                      labelText: 'Products Fabric',
                                      enabled: false,
                                    ),
                                    view.sizedBox(height: 15),
                                    view.textFormField(
                                      controller: TextEditingController(
                                          text: data['productsSize']),
                                      labelText: 'Products Size',
                                      enabled: false,
                                    ),
                                    view.sizedBox(height: 15),
                                    view.textFormField(
                                      controller: TextEditingController(
                                          text: data['productsType']),
                                      labelText: 'Products Type',
                                      enabled: false,
                                    ),
                                    view.sizedBox(height: 35),
                                    view.elevatedButton('Buy Now',
                                        onPressed: () {
                                      payOrderAmount(TextEditingController(
                                          text: data['productsPrice']));
                                    }),
                                    view.sizedBox(height: 35),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
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
