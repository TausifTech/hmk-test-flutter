import 'package:flutter/material.dart';
import 'package:hmk_test/MainScreens/user_profile.dart';
import 'package:hmk_test/Screen/cart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/burgersalt.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text.rich(
              TextSpan(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'This is a food ordering app from ',
                  ),
                  TextSpan(
                    text: 'Hao Mao Khao.\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'We were established in the cold winter of 2017 with some cool people. We had to close but now that we are open again, we will keep on delivering '),
                  TextSpan(
                    text: 'the best food ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'in Narayaganj. Best regards from team '),
                  TextSpan(
                    text: 'Hao Mao Khao',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/pnglogo.png',
                width: 250,
              ),
            ),
            SizedBox(height: 400),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.instagram,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  ' haomaokhao.ng',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.facebook,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  ' facebook.com/haomaokhaong/',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserProfile()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  label: Text(
                    'Testing Page 01',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.access_alarm_rounded,
                    size: 20,
                  ),
                  splashColor: Colors.red,
                ),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  label: Text(
                    'Application Orders',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 20,
                  ),
                  textColor: Colors.black,
                  splashColor: Colors.red,
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
