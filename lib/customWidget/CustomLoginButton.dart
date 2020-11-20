import 'package:flutter/material.dart';
import 'package:flutter_note/values/Colors.dart';

class CustomLoginButton extends StatelessWidget {
  final hasBorder;
  final name;

  CustomLoginButton({this.name, this.hasBorder});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: hasBorder ? white : mainColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: hasBorder
                  ? Border.all(color: mainColor)
                  : Border.fromBorderSide(BorderSide.none)),
          alignment: Alignment.center,
          child: Text(name,
              style: TextStyle(
                  color: hasBorder ? mainColor : white, fontSize: 20)),
        ),
      ),
    );
  }
}
