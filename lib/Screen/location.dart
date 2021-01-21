import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hmk_test/Screen/cart.dart';

import 'package:hmk_test/Screen/map.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLocation extends StatefulWidget {
  @override
  _UserLocationState createState() => new _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  Position _pos;
  String _filtered = 'Please Wait..';
  String address;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    Position currPos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(currPos);

    setState(() {
      _pos = currPos;
      _filtered = '${currPos.latitude}, ${currPos.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          title: Text("Location Page"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Spacer(),
            SelectableText(
              _filtered,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EitaDekho(
                          latitude: '${_pos.latitude}',
                          longitude: '${_pos.longitude}')),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'SEE YOUR CURRENT LOCATION',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white, width: 3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[800].withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            GestureDetector(
              onTap: () {
                address = _filtered;
                createRecord();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CHOOSE CURRENT LOCATION',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white, width: 3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[800].withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text("Set Address"),
                        content: TextField(
                          onChanged: (String value) {
                            address = value;
                          },
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close")),
                          FlatButton(
                              onPressed: () {
                                createRecord();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cart()),
                                );
                              },
                              child: Text("Add")),
                        ],
                      );
                    });
              },
              child: Container(
                child: Center(
                  child: Text('ENTER ADDRESS'),
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white, width: 3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[800].withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            )
          ]),
        ),
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
    final int documents = (qSnap.docs.length);
    final String length = documents.toString();

    final String x = address;

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Orders')
        .doc('Order ' + length)
        .update({
      'Address': x,
    });
  }
}
