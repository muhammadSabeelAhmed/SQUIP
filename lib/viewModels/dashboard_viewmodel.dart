import 'package:squip_assignment/app/app.locator.dart';
import 'package:squip_assignment/app/app.router.dart';
import 'package:squip_assignment/constants/string_constants.dart';
import 'package:squip_assignment/model/role.dart';
import 'package:squip_assignment/views/tabs/ambulance_view.dart';
import 'package:squip_assignment/views/tabs/firebrigade_view.dart';
import 'package:squip_assignment/views/tabs/police_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  var routes = locator<NavigationService>();

  goToEmergencyLevels() {
    routes.navigateToMapSample();
  }

  loadRoleView(Role role) {
    if (role.roleType == StringConstants.police) {
      StringConstants.map_widgets = PoliceView();
    } else if (role.roleType == StringConstants.ambulance) {
      StringConstants.map_widgets = AmbulanceView();
    } else if (role.roleType == StringConstants.fire) {
      StringConstants.map_widgets = FirebrigadeView();
    }
    goToEmergencyLevels();
  }
}
