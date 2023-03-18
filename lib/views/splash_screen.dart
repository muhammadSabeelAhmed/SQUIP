import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:squip_assignment/constants/image_constants.dart';
import 'package:squip_assignment/map_sample.dart';
import 'package:squip_assignment/viewModels/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../constants/color_constants.dart';
import '../constants/font_constants.dart';
import '../constants/string_constants.dart';
import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                color: Color(ColorConstants.GreenColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
//                Image.asset(ImageContants.detailsbg),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 50, horizontal: 50),
                          child: Image.asset(
                            ImageConstants.logo,
                            height: 200,
                            width: 200,
                          )),
                      Text(
                        StringConstants.appName.toUpperCase(),
                        style: TextStyle(
                            fontFamily: FontConstants.Bold,
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.35,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringConstants.getReady,
                      style: TextStyle(
                          fontSize: 28,
                          color: Color(ColorConstants.GreenColor),
                          fontFamily: FontConstants.Bold),
                    ),
                  ),
                  Text(
                    StringConstants.splashDesc,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(ColorConstants.GreenColor),
                        fontWeight: FontWeight.w300),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.goToLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(ColorConstants.GreenColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          StringConstants.getStarted.toUpperCase(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
