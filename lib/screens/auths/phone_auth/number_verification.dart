import 'package:alikay_shop/utils/app_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'otp_verification.dart';

class NumberVerification extends StatefulWidget {
  const NumberVerification({Key? key}) : super(key: key);

  @override
  _NumberVerificationState createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var view = AppWidgets();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Enter Your Mobile Number'),
              view.sizedBox(height: 20),
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
              view.elevatedButton('Continue', onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationId, int? resendToken) {
                      view.nextScreenPush(context: context, screen: OTPVerification(verificationId: verificationId,));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber:"+91${phoneNumber.text.trim()}",
                  );
                }
              },)
            ],
          ),
        ),
      ),
    );
  }
}
