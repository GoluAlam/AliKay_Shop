import 'package:alikay_shop/controller/user_add_to_cart_controller.dart';
import 'package:alikay_shop/controller/user_favorite_list_controller.dart';
import 'package:alikay_shop/controller/user_order_controller.dart';
import 'package:alikay_shop/data_models/add_into_favorite.dart';
import 'package:alikay_shop/data_models/add_to_cart_data_model.dart';
import 'package:alikay_shop/data_models/order_data_model.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final data;
  const PaymentScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isFavorite = false;
  final UserAddToCartController _userAddToCartController =
  UserAddToCartController();
  final UserOrdersController _userOrdersController = UserOrdersController();
  final UserFavoriteListController _userFavoriteListController =
  UserFavoriteListController();
  final Razorpay _razorPay = Razorpay();
  TextEditingController orderNameController = TextEditingController();
  TextEditingController orderPriceController = TextEditingController();
  TextEditingController orderFabricController = TextEditingController();
  TextEditingController orderSizeController = TextEditingController();
  TextEditingController orderTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    orderNameController.text = widget.data['Name'];
    orderPriceController.text = widget.data['Price'];
    orderFabricController.text = widget.data['Fabric'];
    orderSizeController.text = widget.data['Size'];
    orderTypeController.text = widget.data['Type'];

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
    _userOrdersController.orderPaymentDetails(OrderDataModel(
      paymentAmount: orderPriceController.text,
      productsImage: widget.data['Image'],
      productsName: orderNameController.text,
      productsFabric: orderFabricController.text,
      productsSize: orderSizeController.text,
      productsPrice: orderPriceController.text,
      productsType: orderTypeController.text,
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

  void payOrderAmount() {
    var options = {
      'key': 'rzp_test_8q9EoCx5zdsxNX',
      'amount': (double.parse(orderPriceController.text) * 100).toInt(),
      'name': 'Ali',
      'description': 'Description for payment',
      'timeout': 60,
      'prefill': {
        'contact': '8235266260',
        'email': 'ali@gmail.com',
      }
    };
    _razorPay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body: Card(
        child: Column(
          children: [
            Image.network(
              widget.data['Image'],
              height: 300,
              width: 350,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.data['Name'] ?? "Name"),
                Text(widget.data['Price'] ?? "Price"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.data['Fabric'] ?? "Fabric"),
                Text(widget.data['Size'] ?? "Size"),
              ],
            ),
            Text(widget.data['Type'] ?? "Type"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          _userFavoriteListController.userAddFavoriteList(
                              AddFavouritesDataModel(
                                  productsImage: widget.data['Image'],
                                  productsFabric: widget.data['Fabric'],
                                  productsType: widget.data['Type'],
                                  productsSize: widget.data['Size'],
                                  productsPrice: widget.data['Price'],
                                  productsName: widget.data['Name'],
                                  isFavorite: isFavorite));
                        } else {
                          _userFavoriteListController.userRemoveFromFavoriteList(widget.data['addCartId']);
                        }
                      });
                    },
                    icon: isFavorite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                view.elevatedButton('Add to cart', onPressed: () {
                  _userAddToCartController.userAddToCart(AddToCartDataModel(
                      productsName: orderNameController.text,
                      productsPrice: orderPriceController.text,
                      productsSize: orderSizeController.text,
                      productsType: orderTypeController.text,
                      productsFabric: orderFabricController.text,
                      productsImage: widget.data['Image']));
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
                          controller: orderNameController,
                          labelText: 'Products Desc',
                          enabled: false,
                        ),
                        view.sizedBox(height: 15),
                        view.textFormField(
                          controller: orderPriceController,
                          labelText: 'Products Price',
                          enabled: false,
                        ),
                        view.sizedBox(height: 15),
                        view.textFormField(
                          controller: orderFabricController,
                          labelText: 'Products Fabric',
                          enabled: false,
                        ),
                        view.sizedBox(height: 15),
                        view.textFormField(
                          controller: orderSizeController,
                          labelText: 'Products Size',
                          enabled: false,
                        ),
                        view.sizedBox(height: 15),
                        view.textFormField(
                          controller: orderTypeController,
                          labelText: 'Products Type',
                          enabled: false,
                        ),
                        view.sizedBox(height: 35),
                        view.elevatedButton('Buy Now', onPressed: () {
                          payOrderAmount();
                        }),
                        view.sizedBox(height: 30)

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
      ),
    );
  }
}
