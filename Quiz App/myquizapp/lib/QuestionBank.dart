import 'package:myquizapp/Question.dart';
class QuestionBrain{
  int _questionNumber=0;
  List<Question> _questionList=[
    Question('There are five zeros in one hundred thousand', true),
    Question('If you add the two numbers on the opposite sides of dice together, the answer is always 7', true),
    Question('The moon is just 50 percent of the mass of Earth.', false),
    Question('Your nose and sinuses produce almost one liter of mucus a day (which you swallow.)', true),
    Question('Watching horror movies has no reaction to body', false),
    Question('The pupil of a goat is diagonal.', false),
    Question('Human eyes contain a small blind spot where the optic nerve passes through the retina.', true),
    Question('Is China the largest country in the world?', false),
    Question('Spiders have 6 legs. Is it true or false?', false),
    Question('5+9 = 14', true),

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
    return _questionList[_questionNumber].questionText;
  }
  bool? getQuestionAnswer()
  {
    return _questionList[_questionNumber].questionAnswer;
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