import 'package:flutter/material.dart';
import 'package:hmk_test/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In Bro'),
        backgroundColor: Colors.deepOrange[800],
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/dank1.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 400,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MdiIcons.gmail,
                        size: 40,
                      ),
                      Text(
                        ' If you are not registered, \n contact us at haomaokhao@gmail.com',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            child: InkResponse(
              onTap: () {
                context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.black),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 15,
                  )
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
