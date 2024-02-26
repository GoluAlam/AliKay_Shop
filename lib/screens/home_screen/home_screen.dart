import 'package:alikay_shop/controller/products_controller.dart';
import 'package:alikay_shop/screens/home_screen/payment_screen.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../upload_data_firebase/upload.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, Key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GetProductsController _getProductsController = GetProductsController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "AliKay",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text("Upload"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Updates(),
                  ));
            },
          ),
        ],
      )),
      body: ListView(
        shrinkWrap: true,
        children: [
          CarouselSlider(
            items: [
              view.container(
                  image: const AssetImage(
                      'assets/slider_images/fashion_slider1.jpg')),
              view.container(
                  image: const AssetImage(
                      'assets/slider_images/fashion_slider2.jpg')),
              view.container(
                  image: const AssetImage(
                      'assets/slider_images/fashion_slider3.jpg')),
              view.container(
                  image: const AssetImage(
                      'assets/slider_images/fashion_slider4.jpg')),
              view.container(
                  image: const AssetImage(
                      'assets/slider_images/fashion_slider5.jpg')),
            ],
            options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.easeInOut,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration:
                    const Duration(milliseconds: 500),
                viewportFraction: 0.8),
          ),
          view.sizedBox(height: 30),
          FutureBuilder(
            future: _getProductsController.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Material(
                      elevation: 4, // Set the elevation here
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              view.nextScreenPush(
                                  context: context,
                                  screen: PaymentScreen(data: data));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                      child: Image.network(
                                        data['Image'] ?? "",
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    data['Name'] ?? "Name",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 10.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        data['Price'] ?? "Price",
                                        style:
                                            const TextStyle(fontSize: 10.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          FutureBuilder(
            future: _getProductsController.getCoatCategoryData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data?.docs[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white60.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: CachedNetworkImage(
                                  imageUrl: data?['productsImage'] ??
                                      "Image Null",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?['productsName'] ?? "Name Null",
                                      style: TextStyle(fontSize: 12.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(data?['productsPrice'] ??
                                        "Price Null"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          view.sizedBox(height: 20),
          FutureBuilder(
            future: _getProductsController.getEarbudsCategoryData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return SizedBox(
                height: 500,
                child: Center(
                  child: GridView.builder(
                    itemCount: snapshot.data?.docs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                      mainAxisSpacing: 10
                    ),
                    itemBuilder: (context, index) {
                      var data = snapshot.data?.docs[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 130,
                          width: 130,
                          child: Image.network(data?['productsImage'] ?? "Image Null",fit: BoxFit.cover,),
                        ),
                        Text(data?['productsName'] ?? "Name Null"),
                        Text(data?['productsPrice'] ?? "Price Null"),
                      ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
