import 'dart:math';
import 'package:alikay_shop/controller/user_controller.dart';
import 'package:alikay_shop/data_models/user_data_model.dart';
import 'package:alikay_shop/screens/auths/email_auth/sign_in_page.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      appBar: view.appBarView(
        title: const Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold),)
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 38.0,left: 10,right: 10),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  view.textFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Please enter your name');
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    labelText: 'Enter Your Name'
                  ),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: numberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Please enter your number');
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                    labelText: 'Enter Mobile Number',
                  ),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: emailController,
                    validator: (value) {
                      final emailRegex = RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                      if (value!.isEmpty) {
                        return ('Please enter your email');
                      } else if (emailRegex.hasMatch(value)) {
                        return ('Please enter a valid email address');
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                    labelText: 'Enter Your Email',
                  ),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Please enter your password');
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    labelText: 'Enter Your Password',
                  ),
                  view.sizedBox(height: 35),
                  view.elevatedButton('Sign up', onPressed: (){signUp();}),
                  view.sizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('All ready have an account?'),
                      view.textButton('Sign In', onPressed: (){
                        view.nextScreenPushReplacement(context: context, screen: const SignInPage());
                      }),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp()async{
    String name = nameController.text.trim();
    String number = numberController.text.trim();
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();


    try {
       _auth.createUserWithEmailAndPassword(email: email, password: pass).then((value)async{
            var a  = value.user?.uid.toString();
            if(value.user != null){
               UserController().addUsersDetails(UsersDetailsDataModel(userId: a,userName: name,userEmail: email,userPhoneNumber: number));
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()),);
            }
            else{
              Fluttertoast.showToast(
                msg: 'Please Create Your Account',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
      });
      Fluttertoast.showToast(
        msg: 'Sign Up Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );


    } catch (UserCredentialException) {
      print('Failed to Sign Up: $e');
      Fluttertoast.showToast(
        msg: 'Failed to Sign Up: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

}
