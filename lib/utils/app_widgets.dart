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
  Widget textFormField({void Function()? onTap, String? Function(String?)? validator,TextEditingController? controller,TextInputType? keyboardType,String? labelText,Widget? prefixIcon,bool? enabled,Color? cursorColor,Widget? suffixIcon,bool obscureText = false}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      keyboardType: keyboardType,
      enabled: enabled,
      cursorColor: cursorColor,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
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
  Widget category(String text,{required void Function()? onTap,Widget? child,ImageProvider<Object>? backgroundImage,double? radius}){
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: backgroundImage,
            radius: radius,
            child: child,
          ),
          Text(text)
        ],
      ),
    );
  }

  PreferredSizeWidget? appBarView({
    Widget? title,
    Color? backgroundColor,
    double? elevation,
    bool? centerTitle,
    Widget? leading,
    double? titleSpacing,
    PreferredSizeWidget? bottom,
    ShapeBorder? shape,
    Widget? flexibleSpace,
    TextStyle? titleTextStyle,
    double? toolbarHeight
  }){
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: leading,
      titleSpacing: titleSpacing,
      bottom: bottom,
      shape: shape,
      flexibleSpace: flexibleSpace,
      actions: [],
      titleTextStyle: titleTextStyle,
      toolbarHeight: toolbarHeight,


    );
  }

  Widget material({double? width,double? height,Color? color,required void Function()? onPressed,required Widget icon,required Widget label}){
    return Material(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
        ),
        child: TextButton.icon(onPressed: onPressed, icon: icon, label: label),
      ),

    );
  }

 Widget simpleContainer({Widget? child,double? height,double? width,AlignmentGeometry? alignment,
   EdgeInsetsGeometry? margin,Color? color,EdgeInsetsGeometry? padding,Decoration? decoration}){
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      margin: margin,
      color: color,
      padding: padding,
      decoration: decoration,
      child: child,

    );
 }





}
