import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';

class FaqPg extends StatefulWidget {
  @override
  _FaqPgState createState() => _FaqPgState();
}

class _FaqPgState extends State<FaqPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(context),
        drawer: DrawerC() ,
        body: Container(
            height: MediaQuery.of(context).size.height,
            color:Colors.white,
            child: ListView(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left:20.0,top:30.0,right: 20.0,bottom:20.0),
                    child: Text('Contact Us',style:TextStyle(fontSize: MediaQuery.of(context).size.width/10,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                  ),
                  Divider(),
                  Padding(
                    padding:EdgeInsets.only(left:20.0,top:20.0,right: 20.0,bottom:10.0),
                    child: Center(child: Image.asset('assets/logo-full.png'),),
                  ),
                  Divider(),

                ])));
  }
}
