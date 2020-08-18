//import 'dart:async';
//import 'dart:io';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:lw_beta/screens/HomePage.dart';
//import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
//import 'package:progress_dialog/progress_dialog.dart';
//import 'package:lw_beta/screens/RegisterPage.dart';
//class loadclass extends StatefulWidget {
//  @override
//  _loadclassState createState() => _loadclassState();
//}
//
//enum authProblems { UserNotFound, PasswordNotValid, NetworkError }
//class _loadclassState extends State<loadclass> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(child: Padding(
//      padding: const EdgeInsets.only(top:300,bottom:300,left:90,right:100),
//      child: LiquidCircularProgressIndicator(
//        value: 0.5, // Defaults to 0.5.
//        valueColor: AlwaysStoppedAnimation(Colors.blue), // Defaults to the current Theme's accentColor.
//        backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
//        borderColor: Colors.blue,
//        borderWidth: 5.0,
//        direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
//        center: Text("Loading..."),
//      ),
//    ),);
//  }
//}
//
//class Auth {
//
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//
//
//  Future <bool> googleSignout() async {
//    FirebaseAuth.instance.signOut().then((onValue) {
//      print("SignOutttt");
//    }).catchError(((error) {
//      print("Eror");
//      print(error.toString());
//    }));
//    return true;
//  }
//
//
//  Future<FirebaseUser> getCurrentUser() async {
//    FirebaseUser user = await _auth.currentUser();
//    return user;
//  }
//  Future <dynamic> signInNow(var email, var pass, BuildContext context,ProgressDialog p) async
//  {
//
//    FirebaseAuth.instance.signInWithEmailAndPassword(
//        email: email, password: pass).then((currentUser) async {
//      final FirebaseUser user = await FirebaseAuth.instance.currentUser();
//      final String uid = user.uid;
//      p.hide();
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => home()));
//
//    }).catchError((err) {
//      p.hide();
//      showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return AlertDialog(
//              title: Text("Error"),
//              content: Text(err.message),
//              actions: [
//                FlatButton(
//                  child: Text("Ok"),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                )
//              ],
//            );
//          });
//      return 2;
//    });
//  }
//
//  Future <dynamic> signInNow1(var email, var pass, BuildContext context,ProgressDialog p) async
//  {
//    await p.show();
//    FirebaseAuth.instance.signInWithEmailAndPassword(
//        email: email, password: pass).then((currentUser) async {
//      final FirebaseUser user = await FirebaseAuth.instance.currentUser();
//      final String uid = user.uid;
//      p.hide();
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => home()));
//
//    }).catchError((err) {
//      p.hide();
//      showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return AlertDialog(
//              title: Text("Error"),
//              content: Text(err.message),
//              actions: [
//                FlatButton(
//                  child: Text("Ok"),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                )
//              ],
//            );
//          });
//      return 2;
//    });
//  }
//
//
//
//  Future<dynamic>createAcc(var email, var password, BuildContext context, var hostel, var name,
//      var ismale, var rno, var phno,ProgressDialog p) async {
//
//    FirebaseAuth.instance.createUserWithEmailAndPassword(
//        email: email, password: password).then((currentUser) async {
//      final FirebaseUser user = await FirebaseAuth.instance.currentUser();
//      final String uid = user.uid;
//      final o = 1;
//      p.update(
//        progress: 50.0,
//        message: "Please wait...",
//        progressWidget: Container(
//            padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
//        maxProgress: 100.0,
//        progressTextStyle: TextStyle(
//            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
//        messageTextStyle: TextStyle(
//            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
//      );
//      await Firestore.instance.collection("users").document(uid).setData({
//        "email": email,
//        "name": name,
//        'room': rno,
//        'hostel': hostel,
//        'oid': o,
//        'phno': phno,
//        'pass': password
//      });
//      signInNow1(email, password, context,p);
//
//    }).catchError((err) {
//      p.hide();
//      showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return AlertDialog(
//              title: Text("Error"),
//              content: Text(err.message),
//              actions: [
//                FlatButton(
//                  child: Text("Ok"),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                )
//              ],
//            );
//          });});
//
//  }}
////
////abstract class BaseAuth {
////  Future<String> signIn(String email, String password);
////
////  Future<String> signUp(String email, String password);
////
////  Future<FirebaseUser> getCurrentUser();
////
////  Future<void> sendEmailVerification();
////
////  Future<void> signOut();
////
////  Future<bool> isEmailVerified();
////}
////
////class Auth implements BaseAuth {
////  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
////
////  Future<String> signIn(String email, String password) async {
////    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
////        email: email, password: password);
////    FirebaseUser user = result.user;
////    return user.uid;
////  }
////
////  Future<String> signUp(String email, String password) async {
////    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
////        email: email, password: password);
////    FirebaseUser user = result.user;
////    return user.uid;
////  }
////
////  Future<FirebaseUser> getCurrentUser() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    return user;
////  }
////
////  Future<void> signOut() async {
////    return _firebaseAuth.signOut();
////  }
////
////  Future<void> sendEmailVerification() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    user.sendEmailVerification();
////  }
////
////  Future<bool> isEmailVerified() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    return user.isEmailVerified;
////  }
////}