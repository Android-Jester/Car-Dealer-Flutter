import 'package:flutter/material.dart';
import 'package:uvento/helper/buildAppBar.dart';
import 'package:uvento/helper/buildContainer.dart';
import 'package:uvento/helper/constants.dart';
import 'package:uvento/models/car.dart';

import 'detailScreen.dart';

//TODO: 1 - ................................................
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: kPadding,
          right: kPadding,
          top: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildAppBar(iconUrl: 'assets/icons/bell.png'),
            SizedBox(height: 10.0),
            _buildText('Choose a Car'),
            BuildTextSwitch(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cars.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: CarItem(
                      car: cars[index],
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              car: cars[index],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            _buildText('Top Dealers'),
            _buildDealerContainer(Icons.view_week, 'Greadx London', kpink),
            SizedBox(height: 10.0),
            _buildDealerContainer(
                Icons.panorama_fish_eye, 'National Car Rental', kblue),
            SizedBox(height: 15.0),
          ],
        ),
      ),
      bottomNavigationBar: BuildBottomNavBar(),
    );
  }

  Text _buildText(String text) => Text(
        text,
        style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1),
      );
}

//TODO: 2 - ................................................
class CarItem extends StatelessWidget {
  final Car car;
  final Function press;

  const CarItem({Key key, this.car, this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            height: 280,
            width: 215,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      car.fColor,
                      car.sColor,
                    ])),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.all(kPadding),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${car.type}\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    TextSpan(
                      text: "${car.name}",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 170.0,
            child: Padding(
              padding: EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Per Day\n',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        TextSpan(
                          text: "\$${car.price}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'View Details',
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.0,
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
}

//TODO: 3 - ................................................
class BuildTextSwitch extends StatefulWidget {
  @override
  _BuildTextSwitchState createState() => _BuildTextSwitchState();
}

class _BuildTextSwitchState extends State<BuildTextSwitch> {
  var driverOn = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'With a Driver',
          style:
              TextStyle(fontSize: 15.0, color: Colors.grey, letterSpacing: 1),
        ),
        Spacer(),
        Switch(
            value: driverOn,
            onChanged: (value) {
              setState(() {
                driverOn = value;
              });
            })
      ],
    );
  }
}

//TODO: 4 - ................................................
Container _buildDealerContainer(IconData icon, String text, Color color) =>
    Container(
      padding: EdgeInsets.all(kPadding / 2),
      width: double.infinity,
      height: 75.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kaccentColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildContainer(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            color: color,
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '823 Mraz Wall Apt. 324',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: List.generate(
                  4,
                  (index) => Icon(Icons.star, size: 15.0, color: Colors.yellow),
                ),
              ),
              Text(
                '234 Offers',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blueAccent,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );

//TODO: 5 - ................................................

class BuildBottomNavBar extends StatefulWidget {
  @override
  _BuildBottomNavBarState createState() => _BuildBottomNavBarState();
}

class _BuildBottomNavBarState extends State<BuildBottomNavBar> {
  List<String> buttomNav = [
    'assets/icons/app.png',
    'assets/icons/calendar.png',
    'assets/icons/pin.png',
    'assets/icons/user.png',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 18.0),
      color: kaccentColor,
      height: 65.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttomNav.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
          },
          child: Padding(
            padding: EdgeInsets.only(right: kPadding * 2, left: kPadding),
            child: Image.asset(
              buttomNav[index],
              height: 40.0,
              color: selectedIndex == index ? kbottomColor : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
