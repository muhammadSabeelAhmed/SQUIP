import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:squip_assignment/constants/color_constants.dart';
import 'package:squip_assignment/constants/image_constants.dart';
import 'package:squip_assignment/constants/string_constants.dart';
import 'package:squip_assignment/model/role.dart';
import 'package:squip_assignment/viewModels/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DashboardContainer extends StatelessWidget {
  final Role role;
  DashboardContainer(this.role);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, viewModel, child) => InkWell(
        onTap: () {
          viewModel.loadRoleView(role);
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.blueGrey, width: 0.5)),
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  role.image.toString(),
                  height: 40,
                  width: 40,
                  color: Color(ColorConstants.GreenColor),
                ),
                SizedBox(height: 10),
                Text(
                  role.roleType.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(ColorConstants.GreenColor),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
