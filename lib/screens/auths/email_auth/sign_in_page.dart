import 'package:alikay_shop/screens/auths/email_auth/sign_up_page.dart';
import 'package:alikay_shop/screens/home_screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 100,
                    child: Image.asset('assets/images/app_logo.jpeg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Center(
                  child: Container(
                    child: const Text("Sign In",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20, left: 10),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Please enter your email');
                      }
                      else if (emailRegex.hasMatch(value)){
                        return ('Please enter a valid email address');
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Enter Your Email',
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        errorStyle: TextStyle(fontSize: 13.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0))))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20, left: 10),
                child: TextFormField(
                  validator: (value) {
                    if ( value == null || value.isEmpty) {
                      return ('Please enter your password');
                    }
                    return null;
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Password',
                    prefixIcon: Icon(Icons.password, color: Colors.grey),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          SignIn();
                        },
                        label: const Text('Sign In'),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(title: '',),));

              }, child: Text('Create New Account'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> SignIn() async {
    String email = emailController.text;
    String pass = passwordController.text;

    try {
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      print('Logged in successfully : ${credential.user!.uid}');
      Fluttertoast.showToast(
        msg: 'Logged in successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              title: '',
            ),
          ));

    } catch (e) {
      print('Failed to Logged in : ${e}');
      Fluttertoast.showToast(
        msg: 'Failed to Logged in: $e',
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
