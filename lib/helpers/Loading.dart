import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:squip_assignment/constants/font_constants.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            Text(
              "Loading",
              style: TextStyle(
                fontSize: 26,
                fontFamily: FontConstants.Bold,
                color: Colors.blue,
              ),
            ),
            Text(
              "We are fetching results please wait...",
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontConstants.Regular,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
