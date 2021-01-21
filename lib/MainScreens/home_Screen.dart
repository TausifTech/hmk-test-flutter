import 'package:flutter/material.dart';
import 'package:hmk_test/Screen/map.dart';
import 'package:hmk_test/Screen/notes.dart';

import 'package:hmk_test/authentication_service.dart';
import 'package:provider/provider.dart';

import 'package:hmk_test/MainScreens/sliding_cards.dart';
import 'package:hmk_test/MainScreens/user_profile.dart';
import 'package:hmk_test/Screen/cart.dart';
import 'package:hmk_test/StateLessScreens/Loading_Screen.dart';
import 'package:hmk_test/StateLessScreens/UserProfile.dart';
import 'package:hmk_test/example.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      key: scaffoldKey,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black54,
        ),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: Text(
                  "My Nigga!",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontSize: width * 0.05),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ListTile(
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(
                  'My Profile',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Cart'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.group_add),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Example()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.radio),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Credits'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Example()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person_remove),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Sign Out'),
                onTap: () {
                  context.read<AuthenticationService>().signOut();
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(children: <Widget>[
        Positioned(
          right: width * 0.075,
          top: height * 0.085,
          child: GestureDetector(
            onTap: () => scaffoldKey.currentState.openEndDrawer(),
            child: Container(
              child: Center(
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white, width: 3.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800].withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(3, 7), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: width * 0.075,
          top: height * 0.085,
          child: Container(
            child: Center(
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.person_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white, width: 3.0),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 9, 35, 1),
                  Color.fromRGBO(39, 105, 171, 1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[800].withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(3, 7), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Center(
                      child: Image.asset(
                'assets/images/dank1.png',
              ))),
              SlidingCardsView(),
              SizedBox(height: height * 0.01),
              Tailer(),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ]),
    ));
  }
}

class Tailer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Notes()),
          );
        },
        child: Container(
          child: Center(
              child: Icon(
            Icons.message,
            color: Colors.white,
          )),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white, width: 3.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[800].withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(3, 7), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoadingScreen()),
          );
        },
        child: Container(
          child: Center(
              child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          )),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white, width: 3.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[800].withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(3, 7), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EitaDekho(
                    latitude: '23.62506636214718',
                    longitude: '90.50397297316637')),
          );
        },
        child: Container(
          child: Center(
              child: Icon(
            Icons.location_on,
            color: Colors.white,
          )),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white, width: 3.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[800].withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(3, 7), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
