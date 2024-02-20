import 'package:alikay_shop/screens/home_screen/payment_screen.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, Key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    var view = AppWidgets();
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        children: [
          Column(
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
                  future: FirebaseFirestore.instance.collection('products').get(),
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      return const Text('Something went wrong');
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((DocumentSnapshot document){
                          Map<String,dynamic> data = document.data() as Map<String,dynamic>;
                          return InkWell(
                            onTap: (){
                              view.nextScreenPush(context: context, screen: PaymentScreen(data : data));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 180,
                                    child: Image.network(data['Image']  ?? "" ,fit: BoxFit.cover,),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('Name :'),
                                      view.sizedBox(width: 10),
                                      Text(data['Name'] ?? "Name"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('Price :'),
                                      view.sizedBox(width: 10),
                                      Text(data['Price'] ?? "Price"),
                                    ],
                                  ),
                                  // Text(data['Fabric'] ?? "Fabric"),
                                  // Text(data['Size'] ?? "Size"),
                                  // Text(data['Type'] ?? "Type"),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
              )
            ],
          ),
        ],
      ),
    );
  }
}

