import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:saukhyam/screens/RegisterPage.dart';
import 'file:///C:/Users/sidga/AndroidStudioProjects/saukhyam/lib/lang/engString.dart';
import 'package:saukhyam/utils/string_utils.dart';

import '../main.dart';
import 'HomePage.dart';
class LGnew extends StatefulWidget {
  @override
  _LGnewState createState() => _LGnewState();
}

class _LGnewState extends State<LGnew> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passController=TextEditingController();
  var _email, _pass;
  bool ob=true;
  final _formKey = GlobalKey<FormState>();
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    MediaQueryData l;
//    pr = new ProgressDialog(context);pr = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
//    pr.style(
//        message: 'Logging In...',
//        borderRadius: 10.0,
//        backgroundColor: Colors.white,
//        progressWidget: CircularProgressIndicator(),
//        elevation: 10.0,
//        insetAnimCurve: Curves.easeInOut,
//        progress: 0.0,
//        maxProgress: 100.0,
//        progressTextStyle: TextStyle(
//            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
//        messageTextStyle: TextStyle(
//            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
//    );
    l = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[

                ListView(
                  children: <Widget>[
                    Column(

                        crossAxisAlignment: CrossAxisAlignment.start, children: <
                        Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                                color:Color(0xfff47444),
                                height:MediaQuery.of(context).size.height/6,
                                child: Image.asset('assets/sk.PNG')),

                            Container(
                              padding: EdgeInsets.only(
                                  left:50, top: l.size.height /4),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    textUtils.login,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: -3,
                                        fontWeight: FontWeight.w300,
                                        fontSize: l.size.height / 10,
                                        color: Color(0xfff47444)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                            padding: EdgeInsets.only(
                                top: l.size.height/20,
                                left: l.size.height / 20,
                                right: l.size.height / 17),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextFormField(
                                  onSaved: (value)=>_email=value,
                                  validator: (val) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?  null:'Enter a valid email!',
                                  controller: _emailController,
                                  autocorrect: true,
                                  style: TextStyle(fontSize: 18.0,
                                    fontFamily: 'Montserrat',),
                                  decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),

                                    labelText: textUtils.email,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green)),),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  onSaved: (value)=>_pass=value,
                                  validator: (val) => val.length>5 ?  null:'Enter longer pass..',
                                  controller: _passController,
                                  obscureText: ob,
                                  decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),

                                    suffixIcon: IconButton(disabledColor:Colors.grey,onPressed: (){setState(() {
                                      ob=!ob;

                                    });},icon: Icon(Icons.remove_red_eye),),
                                    labelText: textUtils.password,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green)),),
                                ),
                                SizedBox(height: 12.0),
                                SizedBox(height: 12.0),
                                SizedBox(height: l.size.height / 22),
                                FlatButton(
                                  onPressed: () async{
//                                  var ah = Auth();
//                                  if(_formKey.currentState.validate()){
//                                    await pr.show();
//
                                      var em=_emailController.text;
                                      var pa= _passController.text;
//                                    await ah.signInNow(em, pa, context,pr);

//                                  }

                                    //add and register
                                    //  _submit();

                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePg()));
                                  },
                                  child: Container(
                                      height: l.size.height / 16,
                                      child: Material(
                                        borderRadius: BorderRadius.circular(20.0),
                                        shadowColor: Color(0xff228B22),
                                        color: Color(0xff228B22),
                                        elevation: 7.0,
                                        child: Center(
                                          child: Text(
                                            textUtils.signin,
                                            style: TextStyle(
                                                fontSize: l.size.height / 50,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                      )),
                                ),
                                SizedBox(height: 30.0),
                                FlatButton(
                                  child:Text(textUtils.newto,style: TextStyle(
                                    color: Color(0xfff47444),
                                    fontSize: l.size.height/50,
                                    fontFamily: 'Montserrat',),),
                                  onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>rinfo()));
                                  },
                                ),
                              ],
                            )),
                      ),
                    ]),
                    SizedBox(height: 12.0),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
  void _showDialogN(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error signing you in."),
          content: new Text("Wrong email/password."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
