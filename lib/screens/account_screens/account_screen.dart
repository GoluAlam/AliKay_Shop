// Account Screen
import 'package:alikay_shop/screens/account_screens/order_screen.dart';
import 'package:alikay_shop/screens/account_screens/update_account_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auths/email_auth/sign_up_page.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var currentUserId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                   SizedBox(
                    height: 200,
                    child: FutureBuilder(
                      future: FirebaseFirestore.instance.collection('usersDetails').doc(currentUserId).get(),
                      builder: (context, snapshot){

                        if(snapshot.hasError){
                          return Text('Something went wrong');
                        }
                        if(snapshot.hasData && !snapshot.data!.exists){
                          return Text('Document does not exist');
                        }

                        if(snapshot.connectionState == ConnectionState.done){
                          Map<String,dynamic> data = snapshot.data?.data() as Map<String,dynamic>;
                          return  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage('assets/slider_images/fashion_slider3.jpg'),
                                    // backgroundColor: Colors.red,
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data['userName']),
                                      Text(data['userEmail']),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateAccountScreen(data : data),));
                                  }, icon: const Icon(Icons.edit)),
                                ],
                              )
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator(),);
                      },)

                  ),
                 InkWell(
                   onTap: (){},
                   child: const SizedBox(
                     height: 50,
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 22,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Address')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 17,
                              )
                            ],
                          ),
                        ],
                      ),
                   ),
                 ),
                 const SizedBox(height: 10,),
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen(),));
                   },
                   child: const SizedBox(
                     height: 50,
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                size: 22,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Orders')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 17,
                              )
                            ],
                          ),
                        ],
                      ),
                   ),
                 ),
                  const SizedBox(height: 10,),
                  InkWell(
                   onTap: (){},
                   child: const SizedBox(
                     height: 50,
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 22,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('My Wishlist')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 17,
                              )
                            ],
                          ),
                        ],
                      ),
                   ),
                 ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(title: ''),
                          ));
                    },
                    child: const SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(
                            Icons.login_outlined,
                            size: 21,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Log out')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
