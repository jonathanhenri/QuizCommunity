import 'package:flutter/material.dart';
import 'package:quizcommunity/challenger/widgets/next_button/next_button_widget.dart';
import 'package:quizcommunity/crud/quiz/app_bar_create_quiz.dart';
import 'package:quizcommunity/crud/quiz/create_question_widget.cart.dart';
import 'package:quizcommunity/database/awanser_database.dart';
import 'package:quizcommunity/database/question_database.dart';
import 'package:quizcommunity/database/quiz_database.dart';
import 'package:quizcommunity/home/home_controller.dart';
import 'package:quizcommunity/home/home_page.dart';
import 'package:quizcommunity/shared/models/awnser_model.dart';
import 'package:quizcommunity/shared/models/question_model.dart';
import 'package:quizcommunity/shared/models/quiz_model.dart';

class CreateQuizWidget extends StatefulWidget {
  @override
  _CreateQuizWidgetState createState() => _CreateQuizWidgetState();
}

class _CreateQuizWidgetState extends State<CreateQuizWidget> {
  final controller = HomeController();

  TextEditingController controllerQuiz = TextEditingController();
  TextEditingController controllerResp1 = TextEditingController();
  TextEditingController controllerResp2 = TextEditingController();
  TextEditingController controllerResp3 = TextEditingController();
  TextEditingController controllerResp4 = TextEditingController();

  List<AwnserModel> listaRespostas = [];

  @override
  void initState() {
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreateQuizWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Pergunta",
                      hintText: "Digite sua Pergunta",
                    ),
                    controller: controllerQuiz,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CreateAwanserWidget.isRight(
                  title: "Resposta 1",
                  controller: controllerResp1,
                ),
                CreateAwanserWidget.isWrong(
                  title: "Resposta 2",
                  controller: controllerResp2,
                ),
                CreateAwanserWidget.isWrong(
                  title: "Resposta 3",
                  controller: controllerResp3,
                ),
                CreateAwanserWidget.isWrong(
                  title: "Resposta 4",
                  controller: controllerResp4,
                ),
                SizedBox(
                  height: 20,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.green(
                          label: "Salvar Quiz",
                          onTap: () {
                            _salvarQuiz(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: NextButtonWidget.purple(
                          label: "Proxima Pergunta",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateQuizWidget(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _salvarQuiz(BuildContext context) async {
    
    AwnserModel awnserModelCorrect = new AwnserModel(title: controllerResp1.text);
    AwnserModel awnserModel2 = new AwnserModel(title: controllerResp2.text);
    AwnserModel awnserModel3 = new AwnserModel(title: controllerResp3.text);
    AwnserModel awnserModel4 = new AwnserModel(title: controllerResp4.text);

    listaRespostas.add(awnserModelCorrect);
    listaRespostas.add(awnserModel2);
    listaRespostas.add(awnserModel3);
    listaRespostas.add(awnserModel4);

    QuestionModel questionModel = new QuestionModel(
      title: controllerQuiz.text,
      awnsers: listaRespostas,
    );

    List<QuestionModel> listQuestion = [];
    listQuestion.add(questionModel);
    
    QuizModel quizModel = new QuizModel(
      title: controllerQuiz.text,
      questions: listQuestion,
      imagem: 'REVISAR',
      level: Level.facil, // REVISAR
    );

    final dbHelperQuiz = QuizDatabase.instance;
    final idQuiz = await dbHelperQuiz.insert(quizModel.toMapDb());
    quizModel.id = idQuiz;
    questionModel.quizModel = quizModel;

    final dbHelperQuestion = QuestionDatabase.instance;
    final idQuestion = await dbHelperQuestion.insert(questionModel.toMapDb());
    questionModel.id = idQuestion;

    final dbHelperAwnser = AwnserDatabase.instance;
    listaRespostas.forEach((awnser) {
      awnser.questionModel = questionModel;

      dbHelperAwnser.insert(awnser.toMap());
    });


    dbHelperQuiz.queryAllRows().then((value) => print(value.toString()));
    dbHelperQuestion.queryAllRows().then((value) => print(value.toString()));
    dbHelperAwnser.queryAllRows().then((value) => print(value.toString()));






    // .then((id) => {
    // quizModel.id = id,
    // questionModel.quizModel = quizModel,
    // });
    //
    // final dbHelperQuestion = QuestionDatabase.instance;
    // dbHelperQuestion.insert(questionModel.toMapDb()).then((id) => {
    //   questionModel.id = id,
    // });
    //
    // final dbHelperAwnser = AwnserDatabase.instance;
    // listaRespostas.forEach((awnser) {
    //   awnser.questionModel = questionModel;
    //
    //   dbHelperAwnser.insert(awnser.toMap());
    // });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
