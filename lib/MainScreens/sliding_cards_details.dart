import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hmk_test/Screen/location.dart';
import 'package:hmk_test/StateLessScreens/Loading_Screen.dart';

class CardDetails extends StatefulWidget {
  final String itemName;
  final String image;
  final dynamic price;

  const CardDetails({
    Key key,
    this.itemName,
    this.image,
    this.price,
  }) : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  double spicy = 2.0;
  double saucy = 2.0;
  double tomato = 2.0;
  double onion = 2.0;
  double extraCheese = 0.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String image2 = widget.image;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: height * 0.44,
              child: Image.asset(
                'assets/images/$image2',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: height * 0.44,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xCC000000),
                    const Color(0x00000000),
                    const Color(0x00000000),
                    const Color(0xCC000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.32,
            left: width * 0.03,
            child: Text(
              widget.itemName,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 45,
              ),
            ),
          ),
          Positioned(
            top: height * 0.06,
            left: width * 0.05,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: new Icon(Icons.arrow_back_ios),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6,
              decoration: BoxDecoration(
                color: Colors.deepOrange[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: height * 0.02,
                    left: width * 0.1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: height * 0.07,
                      width: width * 0.38,
                      child: Center(
                        child: Text(
                          widget.price.toString() + ' tk',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: height * 0.03,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.02,
                    right: width * 0.1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/cheese3.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: height * 0.07,
                      width: width * 0.38,
                      child: Center(
                        child: Text(
                          '+ ' + (extraCheese * 20).toInt().toString() + ' tk',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.black,
                              fontSize: height * 0.025),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.1,
                    left: width / 4,
                    child: Text(
                      'Default settings are given below and\nRecommended to change ONLY IF necessary',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 10,
                      ),
                    ),
                  ),

                  ///////////////              sliders                                /////////////////////////////////////////
                  ///
                  ///
                  Positioned(
                    bottom: height * 0.14,
                    left: width * 0.05,
                    child: Wrap(direction: Axis.vertical, children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          'SPICY',
                          style: TextStyle(
                              fontFamily: 'Nunito', fontSize: width * 0.05),
                        ),
                        Slider.adaptive(
                          min: 0.0,
                          max: 3.0,
                          value: spicy,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white24,
                          onChanged: (val) {
                            setState(() {
                              spicy = val;
                            });
                          },
                          divisions: 3,
                          label: '$spicy',
                        ),
                      ]),
                      Row(children: <Widget>[
                        Text(
                          'SAUCY',
                          style: TextStyle(
                              fontFamily: 'Nunito', fontSize: width * 0.05),
                        ),
                        Slider.adaptive(
                          min: 0.0,
                          max: 3.0,
                          value: saucy,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white24,
                          onChanged: (val) {
                            setState(() {
                              saucy = val;
                            });
                          },
                          divisions: 3,
                          label: '$saucy',
                        ),
                      ]),
                      Row(children: <Widget>[
                        Text(
                          'TOMATO',
                          style: TextStyle(
                              fontFamily: 'Nunito', fontSize: width * 0.05),
                        ),
                        Slider.adaptive(
                          min: 0.0,
                          max: 2.0,
                          value: tomato,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white24,
                          onChanged: (val) {
                            setState(() {
                              tomato = val;
                            });
                          },
                          divisions: 2,
                          label: '$tomato',
                        ),
                      ]),
                      Row(children: <Widget>[
                        Text(
                          'ONION',
                          style: TextStyle(
                              fontFamily: 'Nunito', fontSize: width * 0.05),
                        ),
                        Slider.adaptive(
                          min: 0.0,
                          max: 3.0,
                          value: onion,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white24,
                          onChanged: (val) {
                            setState(() {
                              onion = val;
                            });
                          },
                          divisions: 3,
                          label: '$onion',
                        ),
                      ]),
                      Wrap(children: <Widget>[
                        Text(
                          'EXTRA \nCHEESE 20TK',
                          style: TextStyle(
                              fontFamily: 'Nunito', fontSize: width * 0.05),
                        ),
                        Slider.adaptive(
                          min: 0.0,
                          max: 3.0,
                          value: extraCheese,
                          activeColor: Colors.yellow,
                          inactiveColor: Colors.white24,
                          onChanged: (val) {
                            setState(() {
                              extraCheese = val;
                            });
                          },
                          divisions: 3,
                          label: '$extraCheese',
                        ),
                      ]),
                    ]),
                  ),

///////////////////////////////////
                  ///
                  ///
                  ///
                  ///
                  Positioned(
                    bottom: height * 0.06,
                    left: 0,
                    child: InkResponse(
                      onTap: () {
                        createRecord();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserLocation()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF162A49),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        height: height * 0.07,
                        width: width * 0.9,
                        child: Row(children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'ADD TO CART',
                            style: TextStyle(
                                fontFamily: 'Nunito', fontSize: height * 0.02),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void createRecord() async {
    final User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid;

    final QuerySnapshot qSnap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Orders')
        .get();
    final int documents = (qSnap.docs.length) + 1;
    final String length = documents.toString();

    final dynamic x = saucy;
    final dynamic y = spicy;
    final dynamic z = onion;
    final dynamic p = extraCheese;
    final dynamic q = tomato;

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Orders')
        .doc('Order ' + length)
        .set({
      'Name': widget.itemName,
      'Price': widget.price + (p * 20),
      'saucy': x,
      'spicy': y,
      'onion': z,
      'tomato': q,
      'extra Cheese': p,
    });
  }
}
