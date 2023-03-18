import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:squip_assignment/constants/color_constants.dart';
import 'package:squip_assignment/constants/image_constants.dart';
import 'package:squip_assignment/constants/string_constants.dart';
import 'package:squip_assignment/model/role.dart';
import 'package:squip_assignment/viewModels/dashboard_viewmodel.dart';
import 'package:squip_assignment/views/dashboard_options_container.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.dashboard),
      ),
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Card(
            color: Color(ColorConstants.GreenColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              color: Colors.blue,
              height: 50,
              width: 100,
            ),
          ),
        ),
        Positioned(
          left: -4,
          right: -4,
          bottom: -4,
          child: Card(
            color: Color(ColorConstants.GreenColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardContainer(
                        Role(StringConstants.police, ImageConstants.police),
                      ),
                      DashboardContainer(
                        Role(StringConstants.ambulance,
                            ImageConstants.ambulance),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardContainer(
                        Role(StringConstants.fire, ImageConstants.fireBrigade),
                      ),
                      DashboardContainer(
                        Role(StringConstants.police, ImageConstants.police),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
