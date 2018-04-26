import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget{

  final bool answer;
  final VoidCallback _onTap;

  AnswerButton(this.answer,this._onTap);
  @override
  Widget build(BuildContext context)
  {
    return new Expanded(child: new Material(
      child: new FittedBox(
        fit: BoxFit.scaleDown,
        // otherwise the logo will be tiny
        child: new InkWell(
          onTap: () => _onTap(),
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
              ),
                padding: new EdgeInsets.all(20.0),
                child: new Text(
                  answer==true?"True":"False",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                )
            ),
        ),
      ),

      color: answer==true?Colors.green:Colors.red,
      ),
    );
  }
}