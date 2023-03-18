import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:squip_assignment/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../constants/string_constants.dart';
import '../helpers/Error.dart';
import '../helpers/Loading.dart';

class LoginViewModel extends BaseViewModel {
  var routes = locator<NavigationService>();

  signInUser(BuildContext context, email, password) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog();
        },
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      goToDashboard();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              StringConstants.error = "The password provided is too weak.";
              return ErrorDialog();
            });
      } else if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              StringConstants.error =
                  "The account already exists for that email.";
              return ErrorDialog();
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            StringConstants.error = "$e";
            return ErrorDialog();
          });
    }
  }

  goToDashboard() {
    routes.navigateToDashboardView();
  }

  goToRegister() {
    routes.navigateToRegisterPage();
  }
}
