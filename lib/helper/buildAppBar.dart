import 'package:flutter/material.dart';
import 'package:uvento/helper/constants.dart';

import 'buildContainer.dart';

class BuildAppBar extends StatelessWidget {
  final String iconUrl;
  final Function func;

  const BuildAppBar({Key key, this.iconUrl, this.func});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: func,
          child: BuildContainer(
            color: kaccentColor,
            child: Image.asset(
              iconUrl,
              color: Colors.white,
            ),
          ),
        ),
        Spacer(),
        BuildContainer(
          color: kaccentColor,
          child: Image.asset(
            'assets/icons/search.png',
            color: Colors.white,
          ),
        ),
        SizedBox(width: 15),
        BuildContainer(
          color: kaccentColor,
          child: Image.asset(
            'assets/icons/adjust.png',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
