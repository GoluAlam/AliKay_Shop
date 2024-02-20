import 'package:alikay_shop/data_models/user_data_model.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../controller/user_controller.dart';

class UpdateAccountScreen extends StatefulWidget {
  final data;
   const UpdateAccountScreen({super.key, required this.data});

  @override
  State<UpdateAccountScreen> createState() => _UpdateAccountScreenState();
}

class _UpdateAccountScreenState extends State<UpdateAccountScreen> {
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updateNumberController = TextEditingController();
  var currentUserId = FirebaseAuth.instance.currentUser?.uid;
  var currentUserEmail = FirebaseAuth.instance.currentUser?.email;


  // _getUserDetails()async{
  //   var firebaseFireStore = await FirebaseFirestore.instance.collection('usersDetails').doc(currentUserId).get();
  //   if(firebaseFireStore.exists){
  //     Map<String,dynamic> data = firebaseFireStore.data() as Map<String,dynamic>;
  //     updateNameController.text = data['userName'];
  //     updateNumberController.text = data['userPhoneNumber'];
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // updateEmailController.text = currentUserEmail.toString();
    // _getUserDetails();
    updateNameController.text = widget.data['userName'];
    updateEmailController.text = widget.data['userEmail'];
    updateNumberController.text = widget.data['userPhoneNumber'];

  }

  // late UserController userController;

  var userController = UserController();


  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(title: const Text('Update Profile',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                view.textFormField(
                    controller: updateNameController,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    labelText: 'Enter Your Name'),
                view.sizedBox(height: 15),
                view.textFormField(
                    controller: updateEmailController,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    enabled: false,
                    labelText: 'Your Email'),
                view.sizedBox(height: 15),
                view.textFormField(
                    controller: updateNumberController,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    enabled: false,
                    labelText: 'Your Number'),
                view.sizedBox(height: 35),
                view.elevatedButton('Update', onPressed: (){
                  userController.userUpdateProfile(UsersDetailsDataModel(
                    userId: widget.data['userId'],
                    userName: updateNameController.text,
                  ));
                  Navigator.pop(context);

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
