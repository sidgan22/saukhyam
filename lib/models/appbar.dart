import 'package:flutter/material.dart';

Widget AppBarCustom(BuildContext context)
{
  return AppBar(
    centerTitle: true,
    title: Text('Saukhyam'),
    backgroundColor: Color(0xfff47444),

    actions: [
      FlatButton.icon(onPressed: ()=> {}, icon: Icon(Icons.person,color: Colors.white,), label: Text(''))
    ],
  );

}
