import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/utils/string_utils.dart';

import '../utils/string_utils.dart';
import '../utils/string_utils.dart';

class FaqPg extends StatefulWidget {
  @override
  _FaqPgState createState() => _FaqPgState();
}

class _FaqPgState extends State<FaqPg> {
  static const loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ";
  List<int> list= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  @override
  void initState() {
    // TODO: implement initState
//    for(int i=0;i<20;i++)
//      list[i]=i+1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBarCustom(context),
        drawer: DrawerC() ,
        body: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left:20.0,top:30.0,right: 20.0,bottom:10.0),
                child: Text('Frequently Asked Questions',style:TextStyle(fontSize: MediaQuery.of(context).size.width/14,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
              ),
              Divider(),
              Container(
                
                height: MediaQuery.of(context).size.height/1.4,
                child: ListView.builder(
                    itemCount: StringUtils.exp.length,
                    itemBuilder: (context,index){
                        return ExpandWidg(index);
                    }),
              ),
              Divider(),

            ]));
  }
  Widget ExpandWidg(int i)
  {
    String s1 = StringUtils.exp[i];
    String s11 = StringUtils.exp1[i];

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.green,width: 2.0)
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
                          s1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    collapsed: Text(
                      s11,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              s11,
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
        ));}
}
