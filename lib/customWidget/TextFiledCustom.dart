import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note/values/Colors.dart';

class TextFiledCustom extends StatefulWidget {
  String label;
  String hint;
  final prefixIcon;
  var suffixIcon;
  var isObscure;
  bool isLastOne;
  final controller;

  TextFiledCustom(
      {this.label: "",
      this.hint: "",
      @required this.prefixIcon,
      @required this.isObscure,
      this.suffixIcon,
      this.isLastOne: false,
      this.controller});

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
        controller: widget.controller,
        autofocus: false,
        textInputAction:
            widget.isLastOne ? TextInputAction.done : TextInputAction.next,
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
            suffixIcon: IconButton(
              icon: Icon(
                widget.suffixIcon,
                size: 20,
                color: mainColor,
              ),
              onPressed: () {
                setState(() {
                  if (widget.isObscure &&
                      widget.suffixIcon == Icons.visibility_off) {
                    widget.suffixIcon = Icons.visibility;
                    widget.isObscure = false;
                  } else if (widget.suffixIcon == Icons.visibility) {
                    widget.suffixIcon = Icons.visibility_off;
                    widget.isObscure = true;
                  }
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: -4),
            labelText: widget.label,
            hintText: widget.hint),
      ),
    );
  }
}
