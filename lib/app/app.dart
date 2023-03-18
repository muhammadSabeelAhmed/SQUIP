import 'package:squip_assignment/map_sample.dart';
import 'package:squip_assignment/services/counter_services.dart';
import 'package:squip_assignment/views/dashboard_view.dart';
import 'package:squip_assignment/views/login.dart';
import 'package:squip_assignment/views/register.dart';
import 'package:squip_assignment/views/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: LoginPage),
  MaterialRoute(page: RegisterPage),
  MaterialRoute(page: DashboardView),
  MaterialRoute(page: MapSample),
], dependencies: [
  Singleton(classType: CounterService),
  LazySingleton(classType: NavigationService)
])
class App {}
