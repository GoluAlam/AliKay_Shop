import 'package:alikay_shop/upload_data_firebase/shoes_upload_screen.dart';
import 'package:alikay_shop/upload_data_firebase/upload_data.dart';
import 'package:flutter/material.dart';
import '../utils/app_widgets.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  var view = AppWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              view.sizedBox(height: 100),
              view.textButton('Clothes', onPressed: (){
                view.nextScreenPush(context: context, screen: UploadData());
              }),
              view.textButton('Shoes', onPressed: (){
                view.nextScreenPush(context: context, screen: ShoesUploadScreen());
              }),
              view.textButton('Summer Clothes', onPressed: (){}),
              view.textButton('Winter Clothes', onPressed: (){}),

            ],
          ),
        ),
      ),
    );
  }
}
