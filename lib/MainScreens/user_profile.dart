import 'package:flutter/material.dart';
import 'package:hmk_test/Screen/cart.dart';
import 'package:hmk_test/example.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[900],
      key: scaffoldKey,
      drawer: Theme(
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
            ],
          ),
        ),
      ),
      body: Stack(children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(350),
              ),
            ),
            height: height * 0.52,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(150),
              ),
            ),
            height: height * 0.6,
          ),
        ),
        Positioned(
          right: width * 0.075,
          top: height * 0.04,
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height * 0.12),
              Tailer(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new IconButton(
          icon: new Icon(Icons.person_outline),
          onPressed: () => Navigator.pop(context),
        ),
        new IconButton(
          icon: new Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
        ),
        new IconButton(
          icon: new Icon(Icons.bookmark),
          onPressed: () {/* Your code */},
        ),
        new IconButton(
          icon: new Icon(Icons.message),
          onPressed: () {/* Your code */},
        ),
      ],
    );
  }
}
