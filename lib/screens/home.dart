import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isDraw = true;
  var uname = "Siddarth Ganesh";
  var uemail = "sidgan22@gmail.com";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this ,duration: Duration(milliseconds: 700),reverseDuration: Duration(milliseconds: 700));
  }
  final scaffKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Saukhyam'),
        leading: IconButton(

          icon: Icon(Icons.menu),
          onPressed: () {
            scaffKey.currentState.openDrawer();
          } ,
        ),
        actions: [
          FlatButton.icon(onPressed: ()=> scaffKey.currentState.openEndDrawer(), icon: Icon(Icons.person,color: Colors.white,), label: Text(''))
        ],
      ),

//      FlatButton.icon(
//          icon: Icon(Icons.person),
//          onPressed: (){},
//          label: Text(''),
//        ),
      endDrawer: UserAccountsDrawerHeader(
        accountName: Text(uname),
      ),
      drawer: Drawer(
        child:  ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Text('Saukhyam')),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}
