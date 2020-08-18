import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';

class ProdPg extends StatefulWidget {
  @override
  _ProdPgState createState() => _ProdPgState();
}

class _ProdPgState extends State<ProdPg> {
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
