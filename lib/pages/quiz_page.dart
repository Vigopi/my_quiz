import 'package:flutter/material.dart';
import '.././utils/question.dart';
import '.././utils/quiz.dart';
import '.././UI/answer_button.dart';
import '.././UI/question_text.dart';
import '../main.dart';
import '.././pages/score_page.dart';
import ".././UI/correct_wrong_overlay.dart";

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}
class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Is New delhi the capital of India",true),
    new Question("Is fast food healthy", false),
    new Question("Is 0 a prime number", false),
    new Question("Is sound travels in water",true),
    new Question("Is this an android device", true),
    new Question("Is smoking causes cancer", true),
    new Question("Is this app nice",true),
    new Question("Is all animals are mamals", false),
    new Question("Is 242 is a perfect square", false),
    new Question("Is chess game has 4 kings", false)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer)
  {
    isCorrect = (currentQuestion.answer==answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayVisible=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.passthrough,
      alignment: const Alignment(0.0, 0.0),
        children: <Widget>[
            new Column(
              children: <Widget>[
                new AnswerButton(true, (){handleAnswer(true);}),
                new QuestionText(questionText, questionNumber),
                new AnswerButton(false, (){handleAnswer(false);}),
              ],
            ),
          overlayVisible==true ? new CorrectWrongOverlay(isCorrect,(){
            if(quiz.length == questionNumber)
              {
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=> new ScorePage(quiz.score, quiz.length)),(Route route)=>route==null);
                return;
              }
            currentQuestion=quiz.nextQuestion;
            this.setState((){
              overlayVisible=false;
              questionNumber=quiz.questionNumber;
              questionText=currentQuestion.question;
            });
          }):new Container(),
        ]
    );
  }
}