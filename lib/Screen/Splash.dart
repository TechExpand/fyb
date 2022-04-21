import 'package:flutter/material.dart';
import 'package:fyb/Network/network.dart';
import 'package:fyb/Screen/Home/Home.dart';
import 'package:fyb/Screen/IntroPages/intro.dart';
import 'package:get_storage/get_storage.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';

class SplashScreenApp extends StatefulWidget {
  const SplashScreenApp({Key? key}) : super(key: key);

  @override
  _SplashScreenAppState createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  void initState() {
    super.initState();
    var network = Provider.of<WebServices>(context, listen: false);
    network.setPath('null');
    checkForUpdate();
    Future.delayed(Duration(seconds: 5), () async {
      return decideFirstWidget();
    });
  }


  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if(info.updateAvailability == UpdateAvailability.updateAvailable){
        InAppUpdate.performImmediateUpdate()
            .catchError((e){
          print(e);
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  Future<dynamic> decideFirstWidget() async {
    final box = GetStorage();
    var network = Provider.of<WebServices>(context, listen: false);


    var  token = box.read('token');
    var  type = box.read('type');

    if (token == null || token == 'null' || token == '' || token.isEmpty) {
      return Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return IntroPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
            (route) => false,
      );
    } else {
      network.setToken(box.read('token'));
      return Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Home(); //SignUpAddress();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
            (route) => false,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: Text('FYBE'),
    );
  }
}
