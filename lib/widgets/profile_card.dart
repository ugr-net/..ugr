import 'package:flutter/material.dart';

import '../colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
              blurRadius: 30,
              color: Colors.white.withOpacity(0.4),
              offset: Offset(0, 0))
        ],
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            width: 130,
            height: 130,
            margin: EdgeInsets.only(bottom: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: primaryColorO,
              borderRadius: BorderRadius.circular(200),
            ),
          ),
          Row()
        ],
      ),
    );
  }
}
