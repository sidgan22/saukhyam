import 'package:flutter/material.dart';
import 'package:saukhyam/screens/home.dart';

Widget AppBarCustom(BuildContext context)
{
  return AppBar(
    centerTitle: true,
    title: GestureDetector(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
        },
  child: Image.asset('assets/logo.png',height: MediaQuery.of(context).size.height/35,),),
//        child: Text('Saukhyam')),
    backgroundColor: Color(0xfff47444),

    actions: [
      FlatButton.icon(onPressed: ()=> {}, icon: Icon(Icons.person,color: Colors.white,), label: Text(''))
    ],
  );

}
