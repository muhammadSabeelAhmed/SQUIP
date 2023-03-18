import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:squip_assignment/constants/image_constants.dart';

import '../../constants/string_constants.dart';

class PoliceView extends StatelessWidget {
  const PoliceView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              StringConstants.emergency_title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          ),
          Container(
            child: Text(
              StringConstants.emergency_desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset(ImageConstants.fight,
                  height: 25, width: 25, color: Colors.black),
              title: Text(StringConstants.fight),
              subtitle: Text(StringConstants.fight_desc),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset(ImageConstants.roberry,
                  height: 25, width: 25, color: Colors.black),
              title: Text(StringConstants.roberry),
              subtitle: Text(StringConstants.roberry_desc),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.woman, color: Colors.black),
              title: Text(StringConstants.harassment),
              subtitle: Text(StringConstants.harassment_desc),
            ),
          ),
        ],
      ),
    );
  }
}
