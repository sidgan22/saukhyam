import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saukhyam/screens/lgnew.dart';
import 'package:saukhyam/utils/MainLocalization.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'screens/reginfo.dart';
import 'screens/home.dart';

import 'dart:async';
import 'services/auth_service.dart';
enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

String lang_code = 'en';

List<String> home_titles;
String login;

void main() => runApp(MaterialApp(
    home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saukhyam',
      theme: ThemeData(
        fontFamily: 'Montserrat',

        //Color(0xFFFCFCFC)
        backgroundColor: Colors.black54,

      ),

    home: MyHomePage(title: 'Saukhyam'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation _animation;
//    if(u.currentUser()!=uid)
//      {
//        Navigator.pushReplacement(
//            context,
//            MaterialPageRoute(builder: (context) => home()));
//      }
//    else
//      {
//        Navigator.pushReplacement(
//            context,
//            MaterialPageRoute(builder: (context) => rinfo()));
//      }
//  var ss = Auth();
  onDoneLoading() async {
    // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
//      print(account);
//      if (account != null) {
//        // user logged
//        print(_currentUser);
//        Navigator.pushReplacement(
//            context,
//            MaterialPageRoute(builder: (context) => LGnew()));
//      } else {
//        Navigator.pushReplacement(
//            context,
//            MaterialPageRoute(builder: (context) => LGnew()));
//      }
//    });
//    print(ss.getCurrentUser());
//    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
//    if(user==null)
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LGnew()));
//    else
//      Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(builder: (context) => home()));
    /// other way there is no user logged.
    //_googleSignIn.signInSilently().whenComplete(() =>  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LgPage())));
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    switch(lang_code) {
      case "en": {
        home_titles = StringUtils.titles_en;
        login = StringUtils.login_en;
      }
      break;

      case "hi": {
        home_titles = StringUtils.titles_hi;
        login = StringUtils.login_hi;
      }
      break;

      default: {

      }
      break;
    }
    controller=AnimationController (vsync: this,duration: Duration(milliseconds: 2500));
    _animation=Tween(begin:0.1,end:1.0).animate(controller);
    controller.forward();
    Timer(Duration(milliseconds: 4000), onDoneLoading);
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfff47444),
      body: Stack(
        children: <Widget>[
          FadeTransition(
            opacity: _animation,
            child:
            Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: Image.asset("assets/sk.PNG"))
                  ],

                )
            ),
          ),
        ],),

    );

  }
}
class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
      Text(_loading.toString())
    ]);
  }
}