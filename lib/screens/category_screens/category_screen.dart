// Category Screen
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: const Text('Category'),),
      body: SingleChildScrollView(
         child: Column(
           children: [
             view.sizedBox(height: 30),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 view.category('Mobile',backgroundImage: const AssetImage('assets/category/mobiles.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Fashion',backgroundImage: const AssetImage('assets/category/fashion1.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Electronics',backgroundImage: const AssetImage('assets/category/electronics1.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Home',backgroundImage: const AssetImage('assets/category/home1.jpg'),radius: 30, onTap: () {

                 }),
               ],
             ),
             view.sizedBox(height: 30),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 view.category('Appliances',backgroundImage: const AssetImage('assets/category/appliances.jpg'),radius: 30, onTap: () {  }),
                 view.category('Laptop',backgroundImage: const AssetImage('assets/category/laptop.jpg'),radius: 30, onTap: () {  }),
                 view.category('Personal Care',backgroundImage: const AssetImage('assets/category/personalcare.jpg'),radius: 30, onTap: () {  }),
                 view.category('Sports',backgroundImage: const AssetImage('assets/category/sports.jpg'),radius: 30, onTap: () {  }),
               ],
             ),
             view.sizedBox(height: 30),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 view.category('Furniture',backgroundImage: const AssetImage('assets/category/furnitures.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Toy & Baby',backgroundImage: const AssetImage('assets/category/toyandbaby.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Medicines',backgroundImage: const AssetImage('assets/category/medicines.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Gift Card',backgroundImage: const AssetImage('assets/category/giftcard.jpg'),radius: 30, onTap: () {

                 }),
               ],
             ),
             view.sizedBox(height: 30),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 view.category('Earbuds',backgroundImage: const AssetImage('assets/category/furnitures.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Shoes',backgroundImage: const AssetImage('assets/category/toyandbaby.jpg'),radius: 30, onTap: () {

                 }),
                 view.category('Watches',backgroundImage: const AssetImage('assets/category/medicines.jpg'),radius: 30, onTap: () {

                 }),
               ],
             ),
           ],
         ),
      ),
    );
  }
}