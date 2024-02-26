import 'package:alikay_shop/screens/account_screens/order_screen.dart';
import 'package:alikay_shop/screens/account_screens/update_account_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../splash_screen/welome_screen.dart';
import 'my_wishlist.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late String currentUserId;

  @override
  void initState() {
    super.initState();
    currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance.collection('usersDetails').doc(currentUserId).get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (!snapshot.hasData || !snapshot.data!.exists) {
                          return const Text('Document does not exist');
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                  const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage('assets/slider_images/fashion_slider3.jpg'),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data['userName']),
                                      Text(data['userEmail']),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateAccountScreen(data: data),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildListTile(
                    icon: Icons.location_on,
                    text: 'Address',
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  _buildListTile(
                    icon: Icons.shopping_bag,
                    text: 'Orders',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen()));
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildListTile(
                    icon: Icons.favorite,
                    text: 'My Wishlist',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyWishLists(),));

                    },
                  ),
                  const SizedBox(height: 10),
                  _buildListTile(
                    icon: Icons.login_outlined,
                    text: 'Log out',
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({required IconData icon, required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(text),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }
}
