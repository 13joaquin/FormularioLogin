
import 'package:flutter/material.dart';
import 'package:formulariologin/main.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

void main() => runApp(Tab());

class Tab extends StatelessWidget {
  const Tab({Key? key}): super(key:  key);
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}): super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  MotionTabController _controller;
  @override
  void iniState(){
    _controller = new MotionTabController(vsync: this,initialIndex: 1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Motion Tab Controller", style: TextStyle(color: Colors.black),),
      ),
      bottomNavigationBar: MotionTabBar(
        labels: [
          'Home',
          'Search',
          'DashBoard'
        ],
        initialSelectedTab: 'Home',
        tabSelectedColor: Colors.redAccent,
        tabIconColor: Colors.green,
        onTabItemSelected: (int value){
          setState(() {
            _controller.index = value;
          });
        },
        icons: [
          Icons.home,
          Icons.search,
          Icons.verified_user
        ],
        textStyle: TextStyle(color: Colors.redAccent),
      ),
      body: MotionTabBarView(
        controller: _controller,
        children: [
          Center(child: Text("Home"),),
          Center(child: Text("Search"),),
          Center(child: Text("DashBoard"),)
        ],
      ),
    ));
  }
}
