import 'package:flutter/material.dart';
import 'landing_page.dart';

class ScorePage extends StatelessWidget{

  final int score;
  final int totalQuestions;

  ScorePage(this.score,this.totalQuestions);

  @override
  Widget build(BuildContext context)
  {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your score",textDirection: TextDirection.ltr,style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold),),
          new Text(score.toString()+"/"+totalQuestions.toString(),textDirection: TextDirection.ltr,style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold)),
          new IconButton(
              icon: new Icon(Icons.arrow_right),
              onPressed: ()=>Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=>new landingPage()), (Route route)=>route==null),
              color: Colors.white,
              iconSize: 50.0,
          )
        ],
      ),
    );
  }
}