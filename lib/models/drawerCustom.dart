import 'package:flutter/material.dart';
import 'package:saukhyam/utils/asset_utils.dart';
import 'package:saukhyam/utils/string_utils.dart';
class DrawerC extends StatefulWidget {
  @override
  _DrawerCState createState() => _DrawerCState();
}

class _DrawerCState extends State<DrawerC> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.0,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        child: ListView.builder(
        itemCount: StringUtils.drawer_items.length+1,
        itemBuilder: (context,index){
          if(index==0)
          {
            return DrawerHeader(
              child: Center(child:Image.asset(AssetUtils.drawer_header)),
              decoration: BoxDecoration(
                color: Color(0xfff47444),
              ),
            );
          }
          return ListTile(
            title: Text("${StringUtils.drawer_items[index-1]}"),
            leading: AssetUtils.drawer_icons[index-1],
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/$index");
            },
          );
        })));}
  }
