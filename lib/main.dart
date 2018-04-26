import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/quiz_page.dart';
import './pages/score_page.dart';
void main() {
  runApp(new MaterialApp(
    home: new landingPage(),
    routes: <String,WidgetBuilder>{
      "quizpage" : (BuildContext context) => new QuizPage(),
    },
  ));
}
