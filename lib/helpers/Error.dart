import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/font_constants.dart';
import '../constants/string_constants.dart';

class ErrorDialog extends StatelessWidget {
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
            Text(
              "${StringConstants.error}",
              style: TextStyle(
                fontSize: 26,
                fontFamily: FontConstants.Bold,
                color: Colors.green,
              ),
            ),
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            Text(
              "Error in loading",
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
