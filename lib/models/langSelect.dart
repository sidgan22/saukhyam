import 'package:flutter/material.dart';
import 'package:saukhyam/main.dart';
import 'package:saukhyam/screens/LoginPage.dart';
import 'package:saukhyam/utils/engString.dart';
import 'package:saukhyam/utils/hinString.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangSel extends StatefulWidget {
  @override
  _LangSelState createState() => _LangSelState();
}

class _LangSelState extends State<LangSel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: AlertDialog(
        title: Text("Select preferred language: "),
        content: Container(
          color: Colors.white12,
          height: MediaQuery.of(context).size.height/2,
          width: double.maxFinite,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Divider(thickness: 3,),
                          ListTile(
                            onTap: () async {

                              final prefs = await SharedPreferences.getInstance();
                              prefs.setString('lang', 'en');
                              textUtils = StringUtilsEn();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => LGnew()));
                            },
                            leading: Icon(Icons.language),
                            title: Text("English"),
                          ),
                          Divider(thickness: 3,),
                          ListTile(
                            onTap: () async {

                              final prefs = await SharedPreferences.getInstance();
                              prefs.setString('lang', 'hi');
                              textUtils = StringUtilsHi();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => LGnew()));
                            },
                            leading: Icon(Icons.language),
                            title: Text("हिन्दी"),
                          ),
                          Divider(thickness: 3,),
                        ]
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
