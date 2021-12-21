import 'package:flutter/material.dart';
import 'navigation_drawer.dart';


import '../theme.dart';

class collapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  // for backward icon--Inkwell--
  final bool isCollapsed;
  // for AnimationController--------
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

//collapsingListTile({@required this.title,@required this.icon});
  collapsingListTile({@required this.title, @required this.icon,@required this.isCollapsed,@required this.animationController, this.isSelected=false,this.onTap});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return collapsingListTileState();
  }

}

class collapsingListTileState extends State <collapsingListTile>{

  Animation<double> _widthAnimation, sizedBoxAnimation;
//generate override method initState--bellow---------
  @override
  void initState() {
    super.initState();
    _widthAnimation = Tween <double> (begin:220, end: 75).animate(widget.animationController);
    sizedBoxAnimation = Tween <double> (begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected
            ? Colors.transparent.withOpacity(0.3) : Colors.transparent,

      ),


      child: Container(
        width: _widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
            children: <Widget>[
              Icon(
                widget.icon,
                color: widget.isSelected ? selectedColor : Colors.white30,
                size: 38.0,
              ),
              SizedBox(width: sizedBoxAnimation.value),
              // to overcome text overflow-------
              //(_widthAnimation.value >= 190) ? Text(widget.title,style: listTitleDefaultTextStyle,): Container()
                (_widthAnimation.value >= 190)? Text(widget.title,style: widget.isSelected
                 ? listTitleSelectedTextStyle : listTitleDefaultTextStyle): Container()
          ],
        ),
      ),
    )
    );
  }
}