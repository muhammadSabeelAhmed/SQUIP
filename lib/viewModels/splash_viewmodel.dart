import 'package:squip_assignment/app/app.locator.dart';
import 'package:squip_assignment/app/app.router.dart';
import 'package:squip_assignment/services/counter_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  var routes = locator<NavigationService>();
  goToMap() {
    routes.navigateToMapSample();
  }

  goToLogin() {
    routes.navigateToLoginPage();
  }
}
