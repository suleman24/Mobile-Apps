
import 'package:myquizapp/multians.dart';

class MultiBrain{
  int _questionNumber=0;
  List<multichoice> _questionList=[
    multichoice('_______ is known as leap day or leap year day:', 'Feb 29','Feb 28','Feb 27','Mar 01','Feb 28'),
    multichoice('The first country to give a robot citizenship:','Saudi Arabia','UAE','USA','Qatar','Saudi Arabia'),
    multichoice('________ is the world’s fastest-sinking city:','Jakarta','Manila','USA','Shanghai','Jakarta'),
    multichoice(' 102-year-old ______ woman is the oldest skydiver in the world: ','American','Chinese','Australian','None of These','Australian'),
    multichoice('Where is the World’s longest sea bridge ? ','Japan','Russia','China','None of These','China'),
    multichoice('_______ is known as leap day or leap year day:', 'Feb 29','Feb 28','Feb 27','Mar 01','Feb 28'),
    multichoice('The first country to give a robot citizenship:','Saudi Arabia','UAE','USA','Qatar','Saudi Arabia'),
    multichoice('________ is the world’s fastest-sinking city:','Jakarta','Manila','USA','Shanghai','Jakarta'),
    multichoice(' 102-year-old ______ woman is the oldest skydiver in the world: ','American','Chinese','Australian','None of These','Australian'),
    multichoice('Where is the World’s longest sea bridge ? ','Japan','Russia','China','None of These','China'),

  ];
  void nextQuestion()
  {
    if(_questionNumber < _questionList.length-1)
    {
      _questionNumber++;
    }
  }
  String? getQuestionText()
  {
    return _questionList[_questionNumber].qtext;
  }
  String? getQuestionAnswer()
  {
    return _questionList[_questionNumber].correctans;
  }
  String? op1()
  {
    return _questionList[_questionNumber].ans1;
  }
  String? op2()
  {
    return _questionList[_questionNumber].ans2;
  }

  String? op3()
  {
    return _questionList[_questionNumber].ans3;
  }

  String? op4()
  {
    return _questionList[_questionNumber].ans4;
  }

  bool isFinished()
  {
    if(_questionNumber >= _questionList.length-1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  int count()
  {
    return _questionList.length;
  }
  void reset()
  {
    _questionNumber=0;
  }

}