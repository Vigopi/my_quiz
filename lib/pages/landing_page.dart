import 'package:flutter/material.dart';
import '.././pages/quiz_page.dart';
class landingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: ()=>Navigator.of(context).pushNamed("quizpage"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            new Text("Let's Quiz",textDirection: TextDirection.rtl,style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50.0),),
            new Text("Tap to start",textDirection: TextDirection.rtl,style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
          ],
        ),
      ),
    );
  }
}