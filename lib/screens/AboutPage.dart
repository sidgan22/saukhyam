import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';

class AbtPg extends StatefulWidget {
  @override
  _AbtPgState createState() => _AbtPgState();
}

class _AbtPgState extends State<AbtPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context),
      drawer: DrawerC(),
      body: Container(

      ),
    );
  }
}
