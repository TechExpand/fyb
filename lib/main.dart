import 'package:flutter/material.dart';
import 'package:fyb/Network/network.dart';
import 'package:fyb/Screen/Splash.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';




void main() {
  runApp(MyApp());
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Crusher',
//       home: Container(
//
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<WebServices>(create: (_) => WebServices()),
          // ChangeNotifierProvider<Utils>(create: (_) => Utils()),
          // ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
        ],
        child: MaterialApp(
          title: 'Crusher',
          home: SplashScreenApp(),
        ));
  }
}
