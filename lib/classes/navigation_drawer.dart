import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_side_bar2/models/navigation_model.dart';
import 'package:my_side_bar2/theme.dart';

import 'collapsing_list_tile.dart';

class NavigationDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationDrawerState();
  }
}
  // add with SingleTickerProviderStateMixin to use AnimationController-----
  //class NavigationDrawerState extends State <NavigationDrawer>{
  class NavigationDrawerState extends State<NavigationDrawer> with SingleTickerProviderStateMixin {
  double maxWidth = 220;
  double minWidth = 80;
 // Animation InkWell---------
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double>widthAnimation;
  int currentSelectedIndex = 0;

//generate override method initState--bellow---------
    @override
    void initState() {
      super.initState();
      _animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 500));
      widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(
          _animationController);
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _animationController,
      builder:(context,widget){
        return getWidget(context, widget);
      },
    );
  }

    Widget getWidget(context, widget) {
      return Material(
        elevation: 80,
        child: Container(
          width: widthAnimation.value,
          color: drawerBackgroundColor,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              collapsingListTile(
                title: 'Sarhan',
                icon: Icons.person,
                animationController: _animationController,
              ),
              Divider(color: Colors.grey, height: 20.0,),
              Expanded(
                // ListView.builder--itemBuilder--separatorBuilder-------
                child: ListView.separated(separatorBuilder: (context,counter){
                  return Divider(height: 12.0);
                },
                  itemBuilder: (context, counter) {
                  return collapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,

                  );},
                  //maintain vertical minu range------------
                  itemCount:navigationItems.length,

                ),
              ),

              // Bakward menu Item------------

              InkWell(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed ? _animationController.forward(): _animationController.reverse();});},
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: selectedColor,
                  size: 50.0,
                ),
              ),
              SizedBox(height: 50.0, ),
                      ],
                    ),
        ),
      );
   }
  }
