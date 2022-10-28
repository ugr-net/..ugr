import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:ugrr/widgets/btn2.dart';

import '../dialog/Dialog1.dart';
import '../widgets/Btn1.dart';
import '../widgets/HomeAdContainer.dart';
import '../widgets/MyScaffold.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double preLoadOffset = 0, _opacity = 1;
  Image logo, preloader;
  @override
  void initState() {
    preloader = Image.asset(
      'assets/images/preload.gif',
      // width: double.maxFinite,
    );
    super.initState();
    logo = Image.asset(
      'assets/images/logo2.png',
      scale: 0.6,
      width: 60,
      height: 70,
      fit: BoxFit.contain,
    );
    Future.delayed(Duration(seconds: 6), () {
      setState(() => preLoadOffset = MediaQuery.of(context).size.width);
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() => _opacity = 0);
    });
  }

  @override
  void didChangeDependencies() {
    precacheImage(preloader.image, context);
    super.didChangeDependencies();
    precacheImage(logo.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: Colors.transparent,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 90,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: logo,
                      ),
                      Container(
                        child: HomeAdContainer(),
                        height: 280,
                      ),
                      SizedBox(height: 20),
                      Input1(
                        onSubmit: (e) {
                          print(e);
                          Navigator.pushNamed(context, RouteManager.search);
                        },
                        icon: Icons.search_rounded,
                        placeholder: "Search Business",
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        width: 150,
                        alignment: Alignment.topLeft,
                        height: 80,
                        child: Btn2(
                            text: "Advanced Search",
                            bgc: Colors.black,
                            onClick: () => Navigator.pushNamed(
                                context, RouteManager.advancedSearch)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 30),
                  child: Flex(direction: Axis.horizontal, children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Btn1(
                          text: "Shop",
                          withIcon: true,
                          icon: Icons.shopping_cart,
                          onClick: () => Navigator.of(context)
                              .pushNamed(RouteManager.generateQRCode),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Btn1(
                          text: "Profile",
                          withIcon: true,
                          icon: Icons.account_circle,
                          onClick: () => Dialog1.showMyDialog(context),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(preLoadOffset, 0),
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                height: Btn1.viewHeight,
                width: Btn1.viewWidth,
                child: preloader,
              ),
            ),
          )
        ],
      ),
    );
  }
}
