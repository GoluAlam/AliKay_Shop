import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../data_models/product_model.dart';

class UploadData extends StatefulWidget {
  const UploadData({Key? key}) : super(key: key);

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final typeController = TextEditingController();
  final fabricController = TextEditingController();
  final sizeController = TextEditingController();
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  File? image0;

  Future<String?> _uploadImage(File? image) async {
    if (image == null) return null;

    try {
      var imageName = DateTime.now().millisecondsSinceEpoch.toString();
      var storageRef = FirebaseStorage.instance.ref().child('products_images/$imageName.jpg');
      await storageRef.putFile(image);
      var downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (error) {
      print('Error uploading image: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Insert Products Details',
                  style: TextStyle(fontSize: 28),
                ),
                const Text("Add Data"),
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: image0 == null
                                ? const Text('No image selected.')
                                : Image.file(image0!),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              setState(() {
                                image0 = File(image.path);
                              });
                            }
                          },
                          child: const Text('Select image'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: typeController,
                  decoration: const InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: fabricController,
                  decoration: InputDecoration(
                      labelText: 'Febric',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: sizeController,
                  decoration: InputDecoration(
                      labelText: 'Size',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (image0 == null ||
                        nameController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        typeController.text.isEmpty ||
                        fabricController.text.isEmpty ||
                        sizeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please fill all the fields and select an image.'),
                      ));
                    } else {
                      var downloadUrl = await _uploadImage(image0!);
                      if (downloadUrl != null) {
                        var product = ProductModel(
                          name: nameController.text,
                          price: priceController.text,
                          type: typeController.text,
                          fabric: fabricController.text,
                          size: sizeController.text,
                          image: downloadUrl,

                        );

                        _firebaseFireStore.collection('products').add(product.toJson()).then((value){
                          var id = value.id;
                          _firebaseFireStore.collection('products').doc(id).update({'id' : id}).then((value){
                            Fluttertoast.showToast(msg: 'Products Uploaded Successfully');
                          });
                        });
                        nameController.clear();
                        priceController.clear();
                        typeController.clear();
                        fabricController.clear();
                        sizeController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Products details submitted successfully!'),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Failed to upload image. Please try again.'),
                        ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Submit Details"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
