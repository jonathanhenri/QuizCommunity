import 'package:quizcommunity/challenger/challenger_page.dart';
import 'package:quizcommunity/challenger/widgets/quiz/quiz_widget.dart';
import 'package:quizcommunity/core/app_colors.dart';
import 'package:quizcommunity/crud/quiz/create_quiz_widget.dart';
import 'package:quizcommunity/home/home_controller.dart';
import 'package:quizcommunity/home/home_start.dart';
import 'package:quizcommunity/home/widgets/app_bar/app_bar_widget.dart';
import 'package:quizcommunity/home/widgets/level_button/level_button_widget.dart';
import 'package:quizcommunity/home/widgets/quiz_card/quiz_card_widget.card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget("Fácil"),
                  LevelButtonWidget("Médio"),
                  LevelButtonWidget("Difícil"),
                  LevelButtonWidget("Perito"),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            image: e.imagem,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengerPage(
                                            questions: e.questions,
                                            title: e.title,
                                          )));
                            },
                            percent: e.questions.length != 0 ? e.questionAnswered / e.questions.length : 0,
                            completed:
                                "${e.questionAnswered}/${e.questions.length}",
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateQuizWidget()));
          },
          child: Icon(Icons.add),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
