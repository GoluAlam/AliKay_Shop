import 'package:flutter/material.dart';

class AppWidgets {
  Widget textButton(String text, {required void Function()? onPressed}) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
  nextScreenPush({required BuildContext context, required Widget screen}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }
  nextScreenPushReplacement({required BuildContext context, required Widget screen}) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }
  Widget elevatedButton(String text, {required void Function()? onPressed}) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
  Widget sizedBox({Widget? child, double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
  Widget textFormField({String? Function(String?)? validator,TextEditingController? controller,TextInputType? keyboardType,String? labelText,Widget? prefixIcon,bool? enabled}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      enabled: enabled,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          errorStyle: TextStyle(fontSize: 13.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
  Widget signInWith(String text,{required void Function()? onPressed,required ImageProvider<Object> image}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: MaterialButton(
            color: Colors.teal[100],
            elevation: 10,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(text)
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget container({required ImageProvider<Object> image}){
    return  Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
            image: image,
            fit: BoxFit.cover,
          )),
    );
  }
  Widget circleAvatar(String text,{ImageProvider<Object>? backgroundImage,double? radius,void Function()? onTap}){
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundImage: backgroundImage,
            radius: radius,
          ),
        ),
        Text(text)
      ],
    );
  }

   bottomSheet({required BuildContext context,required Widget child}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  // Widget popUpMenuButton({void Function(int)? onSelected,}){
  //   return Column(
  //     children: [
  //       PopupMenuButton<int>(
  //         itemBuilder: (context) => [
  //           // PopupMenuItem 1
  //           PopupMenuItem(
  //             value: 1,
  //             // row with 2 children
  //             child: Row(
  //               children: [
  //                 Icon(Icons.star),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text("Get The App")
  //               ],
  //             ),
  //           ),
  //           // PopupMenuItem 2
  //           PopupMenuItem(
  //             value: 2,
  //             // row with two children
  //             child: Row(
  //               children: [
  //                 Icon(Icons.chrome_reader_mode),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text("About")
  //               ],
  //             ),
  //           ),
  //         ],
  //         offset: Offset(0, 100),
  //         color: Colors.grey,
  //         elevation: 2,
  //         onSelected: onSelected
  //         //     (value) {
  //         //   if (value == 1) {
  //         //   } else if (value == 2) {
  //         //   }
  //         // },
  //       ),
  //
  //     ],
  //
  //   );
  // }



}
