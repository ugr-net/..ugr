import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

import 'Btn1.dart';

class Input1 extends StatelessWidget {
  final String placeholder;
  final double my;
  final IconData icon;
  final TextInputAction textInputAction;
  final Function(String) onSubmit, onchange;
  final TextEditingController controller;
  final bool autofocus;
  const Input1(
      {Key key,
      this.placeholder = 'enter text',
      this.my = 3,
      this.onSubmit,
      this.onchange,
      this.controller,
      this.autofocus = false,
      this.textInputAction = TextInputAction.go,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: my),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        constraints: BoxConstraints(maxWidth: Btn1.viewWidth > 600 ? 500 : 350),
        clipBehavior: Clip.hardEdge,
        height: 48,
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(.2),
        ),
        child: TextField(
          style: TextStyle(color: primaryColorO),
          autofocus: autofocus,
          controller: controller,
          clipBehavior: Clip.values[3],
          cursorColor: accentColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            hintText: placeholder,
            hintStyle: TextStyle(color: accentColor),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: accentColor,
            ),
            iconColor: accentColor,
            focusColor: accentColor,
          ),
          textInputAction: textInputAction,
          onSubmitted: onSubmit,
          onChanged: onchange,
        ),
      ),
    );
  }
}
