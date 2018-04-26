import 'dart:math';
import 'package:flutter/material.dart';
class CorrectWrongOverlay extends StatefulWidget{

  final bool isCorrect;
  final VoidCallback _onTap;
  CorrectWrongOverlay(this.isCorrect,this._onTap);
  @override
  State createState()=> new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin{

  Animation<double> _iconAnimation=null;
  AnimationController _iconAnimationController=null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init");
    _iconAnimationController = new AnimationController(duration: new Duration(milliseconds: 500),vsync:this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: ()=>widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
               child: new Transform.rotate(
                 angle:_iconAnimation.value*2*PI,
                 child:new Icon(
                    widget.isCorrect==true?Icons.done:Icons.clear,
                    textDirection: TextDirection.ltr,
                    size: _iconAnimation.value*80,
                    color:widget.isCorrect==true?Colors.green:Colors.red,
            ),),

              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),

            ),
            new Padding(
                padding:new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(
              widget.isCorrect==true?"Correct":"Wrong",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}