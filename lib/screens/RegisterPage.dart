import 'package:flutter/material.dart';

import 'package:saukhyam/screens/LoginPage.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'HomePage.dart';
//import '../services/auth_service.dart';
import 'package:progress_dialog/progress_dialog.dart';

class rinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Montserrat'
        ),
        home:reg()
    );
  }
}

class reg extends StatefulWidget {
  @override
  regState createState() => regState();
}

class regState extends State<reg> {

  String _hostel,_name,_phno,_email,_pass;
  int _rno;bool ob=true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _phController=TextEditingController();
  TextEditingController _rnController=TextEditingController();
  TextEditingController _hostelController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passController=TextEditingController();
  int value;//_isMale is flag for male or female
  bool loading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);pr = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    pr.style(
        message: 'Signing Up...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    MediaQueryData l;
    l = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
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
                                  left:40.0, top: l.size.height /5),
                              child: Column(
                                children: <Widget>[

                                  Text(
                                    textUtils.reg,
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
                      Container(
                          padding: EdgeInsets.only(
                              top: 30.0,
                              left: l.size.height / 20,
                              right: l.size.height / 20),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                onSaved: (value)=>_email=value,
                                validator: (val) {
                                  if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val))
                                  {
                                    return null;
                                  }
                                  else
                                    return  'Enter a valid email!';

                                } ,
                                controller: _emailController,
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),
                                    labelText: textUtils.email,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green))),
                              ),
                              SizedBox(height: 12.0),
                              SizedBox(height: 12.0),
                              TextFormField(

                                onSaved: (value)=>_pass=value,
                                validator: (val) => val.length < 6 ? 'Enter a pass atleast 6 characters!' : null,
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
                              TextFormField(
                                onSaved: (value)=>_name=value,
                                validator: (val) => val.length < 4 ? 'Enter a name atleast 4 characters!' : null,
                                controller: _nameController,
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),

                                    labelText: textUtils.fullname,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green))),
                              ),



                              SizedBox(height: 12.0),
                              TextFormField(
                                controller: _phController,
                                validator: (val) => val.length !=10 ? 'Enter 10 digits!' : null,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),

                                    labelText: textUtils.phno,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green))),
                              ),
                              SizedBox(height: l.size.height / 22),
                              FlatButton(
                                onPressed: () async{
                                  BuildContext ctx=context;
                                  //add and register
//                                var ah=Auth();
                                  if(_formKey.currentState.validate())
                                  {
//                                  await pr.show();
                                  }
//                                var xxx=await ah.createAcc(_emailController.text, _passController.text, context,_hostelController.text,_nameController.text,_isMale,_rnController.text,_phController.text,pr);
//                                print("Error code = asdadasd");
//                                print(xxx);
//                                pr.hide().then((isHidden){});


                                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> home()));
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
                                          textUtils.signup,
                                          style: TextStyle(
                                              fontSize: l.size.height / 50,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 12.0),
                              FlatButton(
                                child:Text(textUtils.alreadyuser,style: TextStyle(
                                  color: Color(0xfff47444),
                                  fontSize: l.size.height/50,
                                  fontFamily: 'Montserrat',),),
                                onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>LGnew()));
                                },
                              ),
                            ],
                          )),
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
//  Future<void> _submit()
//  async {
//    print(_emailController.text);
//    final form = _formKey.currentState;
//    if(form.validate())
//      {
//        setState(() {
//          _email=_emailController.text;
//          _pass=_passController.text;
//          _name=_nameController.text;
//          _phno=_phController.text;
//          _hostel=_hostelController.text;
//          _rno=int.parse(_rnController.text);
//        });
//          await createRec();
//          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => home()));
//      }
//  }
//  void createRec() async
//  {
//    _submit();
//    final databaseReference = Firestore.instance;
//    final o =1;
//    FirebaseUser user = await auth_handler.getCurrentUser();
//    final uid = user.uid;
//    await databaseReference.collection("users")
//        .document(uid)
//        .setData({
//      'email': _email,
//      'name': _name,
//      'room': _rno,
//      'hostel': _hostel,
//      'oid': o,
//      'phno': _phno
//        });
////
//    DocumentReference ref = await databaseReference.collection("users")
//        .add({
//        });
//    print(ref.documentID);
//  }




  _buildSelect({String text, Color background, Color textColor,Color other}) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(
                color: other,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(75.0),color: background),
          child: Center(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 25.0),
              )),
        )
      ],
    );
  }
  buildlist(BuildContext context,List<String> s) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choose your hostel'),
            content: Container(
              width: double.maxFinite,
              height: 300.0,
              child: ListView(
                padding: EdgeInsets.only(left:8.0,right:8.0,top:20.0),
                //map List of our data to the ListView
                children: s.map((data) => InkWell(onTap: (){setText(data, context);},child:Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.home),
                          Text(" "+data),
                        ],
                      ),
                      SizedBox(height:40.0,),
                    ],
                  ),
                ),)).toList(),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  void setText(String s,BuildContext ctx)
  {
    _hostelController.text=s;
    Future.delayed(Duration(seconds: 1));
    Navigator.pop(ctx);
  }


}

