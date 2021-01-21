import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    double height = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Orders'),
        backgroundColor: Colors.deepOrange[800],
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection('Orders')
            .get(),
        builder: buildCartList,
      ),
    );
  }

  Widget buildCartList(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot value = snapshot.data.docs[index];

          return ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.amber,
            ),
            title: Text(
              value.data()["Name"],
              style: TextStyle(color: Colors.amber),
            ),
            subtitle: Text(value.data()["extra Cheese"].toInt().toString() +
                ' Extra Cheese'),
            trailing: Text(value.data()["Price"].toInt().toString() + ' TK'),
            onTap: () => showDialog(
                context: context,
                child: SimpleDialog(
                  title: Center(child: Text(value.data()["Name"])),
                  children: <Widget>[
                    Center(
                        child: Text(value.data()["Price"].toInt().toString() +
                            ' TK\n')),
                    Center(
                        child: Text('Level ' +
                            value.data()["spicy"].toInt().toString() +
                            ' spicy')),
                    Center(
                        child: Text('Level ' +
                            value.data()["saucy"].toInt().toString() +
                            ' saucy')),
                    Center(
                        child: Text('Level ' +
                            value.data()["onion"].toInt().toString() +
                            ' onion')),
                    Center(
                        child: Text('Level ' +
                            value.data()["tomato"].toInt().toString() +
                            ' tomato\n')),
                    Center(
                        child: Text(
                            value.data()["extra Cheese"].toInt().toString() +
                                ' Extra Cheese\n')),
                    Center(
                      child: SimpleDialogOption(
                        child: Text(
                          '( See Location )',
                          style: TextStyle(color: Colors.yellow[800]),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )),
          );
        },
      );
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      // Handle no data
      return Center(
        child: Image.asset(
          'assets/images/noorders.jpg',
          fit: BoxFit.fitWidth,
        ),
      );
    } else {
      // Still loading
      return Center(
          child: CircularProgressIndicator(
        strokeWidth: 10,
      ));
    }
  }
}
