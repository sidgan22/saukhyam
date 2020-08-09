import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Saukhyam'),
        backgroundColor: Color(0xfff47444),
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
              child: Center(child:Image.asset('assets/sk.PNG')),
              decoration: BoxDecoration(
                color: Color(0xfff47444),
              ),
            ),
            ListTile(

              title: Text('About Us',),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Why Switch?'),
              leading: Icon(Icons.swap_horiz),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Collection'),
              leading: Icon(Icons.collections_bookmark),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Shop',),
              leading: Icon(Icons.shopping_basket),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              leading: Icon(Icons.contacts),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),

      ),
      body: ListView(
        children: [

            CarouselSlider(
                items: [Image.asset('assets/sk.PNG'),Image.asset('assets/sk.PNG'),Image.asset('assets/sk.PNG'),Image.asset('assets/sk.PNG')],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height/3,
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
            child: Text('About Us.',style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width/10),),
          ),
          SizedBox(height: 15,),
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
                          "ExpandablePanel",
                          style: Theme.of(context).textTheme.body2,
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
