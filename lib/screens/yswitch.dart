import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/screens/home.dart';

class SwitchWhy extends StatefulWidget {
  @override
  _SwitchWhyState createState() => _SwitchWhyState();
}

class _SwitchWhyState extends State<SwitchWhy> {
  final scaffKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Why Switch?')
          ],
        ),
      ),
    );
  }
}
