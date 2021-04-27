import 'package:flutter/material.dart';
import 'package:uvento/helper/constants.dart';

import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Stack(
        children: [
          Container(
            height: mediaQuery.height,
            width: mediaQuery.width,
            child: Image.asset(
              'assets/images/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 80.0,
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50.0,
                      ),
                      children: [
                        TextSpan(text: "Luxury\nCar Rental"),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  buildText("Email", 25, Colors.grey),
                  SizedBox(height: 10.0),
                  buildText("Password", 25, Colors.grey),
                  SizedBox(height: 25.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: kbottomColor,
                      child: Image.asset(
                        'assets/icons/right-arrow.png',
                        color: Colors.white,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: kPadding,
            child: Container(
              width: mediaQuery.width,
              margin: EdgeInsets.only(left: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildText("Sign Up", 17, Colors.blueGrey[800]),
                  SizedBox(width: 20.0),
                  CircleAvatar(
                    radius: 2.0,
                    backgroundColor: Colors.blueGrey[800],
                  ),
                  SizedBox(width: 20.0),
                  buildText("Forget Password", 17, Colors.blueGrey[800]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Text buildText(String text, double size, Color color) => Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
      );
}
