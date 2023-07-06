
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final String text;
  final Icon? icon;
  final String? iconData;
  final TextEditingController? controller;
  final Color? fillColor;



  const InputTextField({Key? key, required this.text,  this.icon,this.controller,this.iconData,this.fillColor=Colors.transparent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: primaryColor,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          filled: true,
          hoverColor: primaryColor,
          focusColor: primaryColor,
          fillColor: fillColor,
          isDense: true, // important line
          contentPadding: EdgeInsets.fromLTRB(10, 12, 10, 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 1,color: blueGrey),
          ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(width: 1,color: blueGrey),
        ),
          hintText: text,
          suffixIcon:icon,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text(iconData!,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
      ),
    );
  }
}
