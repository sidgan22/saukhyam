import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/screens/contact.dart';
import 'package:saukhyam/screens/faqpg.dart';
import 'package:saukhyam/screens/lgnew.dart';
import 'package:saukhyam/screens/testimonial.dart';
import 'package:saukhyam/screens/washwear.dart';
import 'package:saukhyam/screens/yswitch.dart';
import 'package:saukhyam/utils/asset_utils.dart';
import 'package:saukhyam/utils/string_utils.dart';
class HomePg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat'
    ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/1': (context) => SwitchWhy(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/2': (context) => WashWear(),
        '/3': (context) => FaqPg(),
        '/4': (context) => ContactPg(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isDraw = true;
  var uname = "Siddarth Ganesh";
  TextStyle drawerIcons = TextStyle(color: Colors.white);
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

    Size carouselSize =(MediaQuery.of(context).size/4);
    return Scaffold(
      key: scaffKey,
      appBar:AppBarCustom(context),

//      FlatButton.icon(
//          icon: Icon(Icons.person),
//          onPressed: (){},
//          label: Text(''),
//        ),
      endDrawer: UserAccountsDrawerHeader(
        accountName: Text(uname),

      ),
      drawer:DrawerC(),
//
      body: ListView(
        children: [

            CarouselSlider(
                items: [Image.asset('assets/sk.PNG'),Image.asset('assets/sk.PNG'),Image.asset('assets/sk.PNG'),Image.asset('assets/sk.PNG')],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height/5,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )
            ),
            Divider(),
          Padding(
            padding: EdgeInsets.only(top:20.0,left: 20.0),
            child: Text('About Us',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: MediaQuery.of(context).size.width/10,fontFamily: 'Montserrat'),),
          ),
          SizedBox(height: 15,),
          ExpandableWidg(),
          ExpandableWidg(),
          ExpandableWidg(),

        ],
      )
    );
  }
  Widget ExpandableWidg()
  {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Saukhyam as first choice for women.",
                          style:TextStyle(fontWeight: FontWeight.bold),
                        )),
                    collapsed: Text(
                      loremIpsum,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(5))
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                loremIpsum,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
