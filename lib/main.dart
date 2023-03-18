import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:squip_assignment/app/app.locator.dart';
import 'package:squip_assignment/map_sample.dart';
import 'package:squip_assignment/views/dashboard_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}


    // showModalBottomSheet(
    //                 context: context,
    //                 builder: (context) {
    //                   return Wrap(
    //                     children: [
    //                       ListTile(
    //                         leading: Icon(Icons.share),
    //                         title: Text('Share'),
    //                       ),
    //                       ListTile(
    //                         leading: Icon(Icons.copy),
    //                         title: Text('Copy Link'),
    //                       ),
    //                       ListTile(
    //                         leading: Icon(Icons.edit),
    //                         title: Text('Edit'),
    //                       ),
    //                     ],
    //                   );
    //                 },
    //               );
