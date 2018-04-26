import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget{
  final String _question;
  final int _questionNumber;
  QuestionText(this._question,this._questionNumber);

  @override
  State createState()=> new QuestionTextState();
}
class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {

  Animation<double> _fontSizeAnimation = null;
  AnimationController _fontSizeAnimationController = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init");
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500),vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.ease);
    _fontSizeAnimation.addListener(()=> this.setState((){}));
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question!=widget._question)
      {
        _fontSizeAnimationController.reset();
        _fontSizeAnimationController.forward();
      }
  }

  @override
  Widget build(BuildContext context)
  {
    return new Material(
      color: Colors.white,
      child:new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child:new Center(
          child: new Text(
            widget._questionNumber.toString()+") "+widget._question,
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontSize: _fontSizeAnimation.value*15),
          ),
        ),
      ),
    );
  }
}