import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note/values/Colors.dart';

class TextFiledCustom extends StatefulWidget {
  String label;
  String hint;
  final prefixIcon;
  final suffixIcon;
  final isObscure;
  final txt = TextEditingController();

  TextFiledCustom(
      {this.label: "", this.hint: "", @required this.prefixIcon, @required this.isObscure, this.suffixIcon});

  @override
  State<StatefulWidget> createState() {
    return _TextFiledCustom();
  }
}

class _TextFiledCustom extends State<TextFiledCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.only(top: 8),
      child: TextField(
        autofocus: false,
        // textInputAction: TextInputAction.route,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          //prevent label to change position to top
          floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            isDense: true,
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none),
            focusedBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: mainColor)),
            labelStyle: TextStyle(color: mainColor),
            prefixIcon: Icon(
              widget.prefixIcon,
              size: 20,
              color: mainColor,
            ),
            suffixIcon: Icon(
              widget.suffixIcon,
              size: 20,
              color: mainColor,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: -4),
            labelText: widget.label,
            hintText: widget.hint),
      ),
    );
  }

}