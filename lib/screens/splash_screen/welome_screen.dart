import 'package:alikay_shop/screens/auths/email_auth/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_widgets.dart';
import '../auths/phone_auth/otp_verification.dart';
import '../home_screen/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);

          }
        }
      } catch (e) {
        print('Error during Google Sign-In: $e');
      }
    }
    var view = AppWidgets();
    return Scaffold(
      appBar: view.appBarView(
        title: Text(
          AppConstants.welcomeText,
          style: const TextStyle(color: AppConstants.appTextColor),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstants.appMainColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                view.textFormField(
                  controller: phoneNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'Enter phone number',
                ),
                view.sizedBox(height: deviceHeight / 30),
                view.elevatedButton('Continue', onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationId, int? resendToken) {
                      view.nextScreenPush(context: context, screen: OTPVerification(verificationId: verificationId,));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber:"+91${phoneNumber.text.trim()}",
                  );
                },),
                view.sizedBox(height: deviceHeight / 10),
                ElevatedButton.icon(
                  onPressed: () => signInWithGoogle(context),
                  icon: Image.asset('${AppConstants.assetsImages}google.png',height: 20,),
                  label: const Text('Sign in with Google', style: TextStyle(color: AppConstants.appTextColor),
                  ),
                  style: ElevatedButton.styleFrom(primary: AppConstants.appSecondaryColor,
                  ),
                ),
                view.sizedBox(
                  height: deviceHeight / 25
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    view.nextScreenPush(context: context, screen: const SignInPage());
                  },
                  icon: const Icon(Icons.email, color: AppConstants.appTextColor),
                  label: const Text('Sign in with Email', style: TextStyle(color: AppConstants.appTextColor),
                  ),
                  style: ElevatedButton.styleFrom(primary: AppConstants.appSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
