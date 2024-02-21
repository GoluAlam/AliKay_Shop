import 'package:alikay_shop/screens/home_screen/payment_screen.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
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
      appBar: AppBar(title: const Text("AliKay",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue),
      drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.upload),
                title: const Text("Upload"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Updates(),));
                },
              ),
            ],
          )
      ),
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
                      return const Center(child: CupertinoActivityIndicator(),);
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

                                      Text(data['Name'] ?? "Name"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(data['Price'] ?? "Price"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
              ),
              FutureBuilder(
                future: FirebaseFirestore.instance.collection('allProducts').where('CategoryName', isEqualTo: 'coat').get(),
                builder: (context,snapshot) {
                  if(snapshot.hasError){
                    return const Text('Something went wrong');
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CupertinoActivityIndicator(),);
                  }
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data?.docs[index];
                        return Card(
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 150,
                                  height: 180,
                                  child: Image.network(data?['productsImage'] ?? "Image Null",fit: BoxFit.cover,)),
                              Text(data?['productsName'] ?? "Name Null"),
                              Text(data?['productsPrice'] ?? "Price Null"),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },),
              FutureBuilder(
                future: FirebaseFirestore.instance.collection('allProducts').where('CategoryName', isEqualTo: 'earbuds').get(),
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return const Text('Something went wrong');
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CupertinoActivityIndicator(),);
                  }
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data?.docs[index];
                        return Card(
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 150,
                                  height: 180,
                                  child: Image.network(data?['productsImage'] ?? "Image Null",fit: BoxFit.cover,)),
                              Text(data?['productsName'] ?? "Name Null"),
                              Text(data?['productsPrice'] ?? "Price Null"),
                            ],
                          ),
                        );

                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

