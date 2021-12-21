import 'package:flutter/material.dart';
import 'package:my_side_bar2/theme.dart';

import 'classes/navigation_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: drawerBackgroundColor,
          title: Center(child: Text('My Side Bar')),
        ),
      body: Stack(
        children: <Widget>[
         Container(color: Colors.blue,),
          NavigationDrawer(),
      ],

     ),
    );
  }
}












