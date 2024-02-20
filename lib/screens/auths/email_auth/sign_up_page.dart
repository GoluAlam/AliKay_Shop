import 'dart:math';
import 'package:alikay_shop/controller/user_controller.dart';
import 'package:alikay_shop/data_models/user_data_model.dart';
import 'package:alikay_shop/screens/auths/email_auth/sign_in_page.dart';
import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../home_screen/home_page.dart';
import '../phone_auth/number_verification.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required String title});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential result = await _auth.signInWithCredential(authCredential);
        User? user = result.user;

        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(title: '')),
          );
        }
      }
    } catch (e) {
      print('Error during Google Sign-In: $e');
      // Handle the error accordingly (show a message, log, etc.)
    }
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 30),
                  child: Container(
                    child: Column(
                      children: [
                        Text("Create",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,)),
                        Text('Account')
                      ],
                    )
                  ),
                ),
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
                view.sizedBox(height: 35),
                view.signInWith("Sign In with Google",onPressed: () {signInWithGoogle(context);}, image: const AssetImage('assets/images/google.png'),),
                view.sizedBox(height: 10),
                view.signInWith("Sign In with Number",onPressed: (){view.nextScreenPush(context: context, screen: const NumberVerification());}, image: const AssetImage('assets/images/mobile.png'),),
                view.textButton('All ready have an account', onPressed: (){
                  view.nextScreenPushReplacement(context: context, screen: const SignInPage());
                })
              ],
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
               Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()),);
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
