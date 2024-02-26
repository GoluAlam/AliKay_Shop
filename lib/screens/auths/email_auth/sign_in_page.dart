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
      appBar: AppBar(
        title: Text('SignIn',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
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
                ElevatedButton(onPressed: (){SignIn();}, child: const Text('Sign In')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage(),));

                    }, child: const Text("Sign Up")),

                  ],
                ),
              ],
            ),
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

      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage(),));

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
