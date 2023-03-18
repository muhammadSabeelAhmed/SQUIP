import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:squip_assignment/constants/image_constants.dart';
import 'package:squip_assignment/constants/string_constants.dart';

class AmbulanceView extends StatelessWidget {
  const AmbulanceView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              StringConstants.emergency_title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
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
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.medical_services, color: Colors.black),
              title: Text(StringConstants.medical),
              subtitle: Text(StringConstants.medical_desc),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.fire_truck, color: Colors.black),
              title: Text(StringConstants.fire),
              subtitle: Text(StringConstants.fire_desc),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Image.asset(ImageConstants.accident,
                  height: 25, width: 25, color: Colors.black),
              title: Text(StringConstants.accident),
              subtitle: Text(StringConstants.accident_desc),
            ),
          ),
        ],
      ),
    );
  }
}
