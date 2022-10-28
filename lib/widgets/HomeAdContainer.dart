import 'package:flutter/material.dart';
import 'package:ugrr/widgets/Btn1.dart';

class HomeAdContainer extends StatelessWidget {
  const HomeAdContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: Btn1.viewHeight / 3, maxWidth: 400),
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: Btn1.viewHeight / 3,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text('Ads Container'),
    );
  }
}
