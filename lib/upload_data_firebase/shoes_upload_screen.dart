import 'package:alikay_shop/upload_data_firebase/data_model/man_shoes_data_model.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'controller/shoes_controller/shoes_controller.dart';

class ShoesUploadScreen extends StatefulWidget {
  const ShoesUploadScreen({super.key});

  @override
  State<ShoesUploadScreen> createState() => _ShoesUploadScreenState();
}

class _ShoesUploadScreenState extends State<ShoesUploadScreen> {

  TextEditingController manShoesName = TextEditingController();
  TextEditingController manShoesPrice = TextEditingController();
  TextEditingController manShoesSize = TextEditingController();
  TextEditingController manShoesColor = TextEditingController();
  TextEditingController manShoesBrand = TextEditingController();
  TextEditingController manShoesMaterial = TextEditingController();
  // late var _selectedCategory;

  TextEditingController womenShoesName = TextEditingController();
  TextEditingController womenShoesPrice = TextEditingController();
  TextEditingController womenShoesSize = TextEditingController();
  TextEditingController womenShoesColor = TextEditingController();
  TextEditingController womenShoesBrand = TextEditingController();
  TextEditingController womenShoesMaterial = TextEditingController();

  TextEditingController kidsShoesName = TextEditingController();
  TextEditingController kidsShoesPrice = TextEditingController();
  TextEditingController kidsShoesSize = TextEditingController();
  TextEditingController kidsShoesColor = TextEditingController();
  TextEditingController kidsShoesBrand = TextEditingController();
  TextEditingController kidsShoesMaterial = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0,left: 10,right: 10),
          child: Column(
            children: [
              view.sizedBox(height: 50),
              const Center(child: Text('Man',style: TextStyle(fontSize: 30),)),
              
              view.textFormField(controller: manShoesName,labelText: 'ShoesName'),
              view.sizedBox(height: 15),
              view.sizedBox(height: 15),
              view.textFormField(controller: manShoesPrice,labelText: 'ShoesPrice'),
              view.sizedBox(height: 15),
              view.textFormField(controller: manShoesSize,labelText: 'ShoesSize'),
              view.sizedBox(height: 15),
              view.textFormField(controller: manShoesColor,labelText: 'ShoesColor'),
              view.sizedBox(height: 15),
              view.textFormField(controller: manShoesBrand,labelText: 'ShoesBrand'),
              view.sizedBox(height: 15),
              view.textFormField(controller: manShoesMaterial,labelText: 'ShoesMaterial'),
              view.sizedBox(height: 35),
              view.elevatedButton('Submit', onPressed: (){
                ShoesController().addShoesToMensCategory(CategoryProductsDataModel(
                  shoesName: manShoesName.text,
                  shoesPrice: manShoesPrice.text,
                  shoesSize: manShoesSize.text,
                  shoesColor: manShoesColor.text,
                  shoesBrand: manShoesBrand.text,
                  shoesMaterial: manShoesMaterial.text,
                ));
                manShoesName.clear();
                manShoesPrice.clear();
                manShoesSize.clear();
                manShoesColor.clear();
                manShoesBrand.clear();
                manShoesMaterial.clear();
                // Navigator.pop(context);
              }),

              view.sizedBox(height: 50),
              const Center(child: Text('Women',style: TextStyle(fontSize: 30),)),
              view.textFormField(controller: womenShoesName,labelText: 'ShoesName'),
              view.sizedBox(height: 15),
              view.textFormField(controller: womenShoesPrice,labelText: 'ShoesPrice'),
              view.sizedBox(height: 15),
              view.textFormField(controller: womenShoesSize,labelText: 'ShoesSize'),
              view.sizedBox(height: 15),
              view.textFormField(controller: womenShoesColor,labelText: 'ShoesColor'),
              view.sizedBox(height: 15),
              view.textFormField(controller: womenShoesBrand,labelText: 'ShoesBrand'),
              view.sizedBox(height: 15),
              view.textFormField(controller: womenShoesMaterial,labelText: 'ShoesMaterial'),
              view.sizedBox(height: 35),
              view.elevatedButton('Submit', onPressed: (){
                ShoesController().addShoesToMensCategory(CategoryProductsDataModel(
                  shoesName: womenShoesName.text,
                  shoesPrice: womenShoesPrice.text,
                  shoesSize: womenShoesSize.text,
                  shoesColor: womenShoesColor.text,
                  shoesBrand: womenShoesBrand.text,
                  shoesMaterial: womenShoesMaterial.text,
                ));
                womenShoesName.clear();
                womenShoesPrice.clear();
                womenShoesSize.clear();
                womenShoesColor.clear();
                womenShoesBrand.clear();
                womenShoesMaterial.clear();
                // Navigator.pop(context);
              }),

              view.sizedBox(height: 50),
              const Center(child: Text('Kids',style: TextStyle(fontSize: 30),)),
              view.textFormField(controller: kidsShoesName,labelText: 'ShoesName'),
              view.sizedBox(height: 15),
              view.textFormField(controller: kidsShoesPrice,labelText: 'ShoesPrice'),
              view.sizedBox(height: 15),
              view.textFormField(controller: kidsShoesSize,labelText: 'ShoesSize'),
              view.sizedBox(height: 15),
              view.textFormField(controller: kidsShoesColor,labelText: 'ShoesColor'),
              view.sizedBox(height: 15),
              view.textFormField(controller: kidsShoesBrand,labelText: 'ShoesBrand'),
              view.sizedBox(height: 15),
              view.textFormField(controller: kidsShoesMaterial,labelText: 'ShoesMaterial'),
              view.sizedBox(height: 35),
              view.elevatedButton('Submit', onPressed: (){
                ShoesController().addShoesToMensCategory(CategoryProductsDataModel(
                  shoesName: kidsShoesName.text,
                  shoesPrice: kidsShoesPrice.text,
                  shoesSize: kidsShoesSize.text,
                  shoesColor: kidsShoesColor.text,
                  shoesBrand: kidsShoesBrand.text,
                  shoesMaterial: kidsShoesMaterial.text,
                ));
                kidsShoesName.clear();
                kidsShoesPrice.clear();
                kidsShoesSize.clear();
                kidsShoesColor.clear();
                kidsShoesBrand.clear();
                kidsShoesMaterial.clear();
                // Navigator.pop(context);
              }),
              view.sizedBox(height: 50),

            ],
          ),
        ),
      ),
    );
  }
}
