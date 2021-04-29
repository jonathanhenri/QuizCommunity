import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizcommunity/challenger/widgets/next_button/next_button_widget.dart';
import 'package:quizcommunity/core/app_text_styles.dart';
import 'package:quizcommunity/crud/quiz/app_bar_create_quiz.dart';
import 'package:quizcommunity/home/home_controller.dart';
import 'package:quizcommunity/home/home_page.dart';

class CreateQuizWidget extends StatefulWidget {
  @override
  _CreateQuizWidgetState createState() => _CreateQuizWidgetState();
}

class _CreateQuizWidgetState extends State<CreateQuizWidget> {
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
    return Scaffold(
      appBar: AppBarCreateQuizWidget(user: controller.user!),
      body: Column(
        children: [
          TextField(
            style: AppTextStyles.title,
            decoration: InputDecoration(
              icon: Icon(Icons.question_answer),
              labelText: "Titulo",
              hintText: "Titulo do seu quiz",
            ),
          ),
          TextField(
            style: AppTextStyles.title,
            decoration: InputDecoration(
              icon: Icon(Icons.question_answer),
              labelText: "Questão 1",
              hintText: "Titulo do seu quiz",
            ),
          ),
          TextField(
            style: AppTextStyles.title,
            decoration: InputDecoration(
              icon: Icon(Icons.question_answer),
              labelText: "Questão 2",
              hintText: "Titulo do seu quiz",
            ),
          ),
          TextField(
            style: AppTextStyles.title,
            decoration: InputDecoration(
              icon: Icon(Icons.question_answer),
              labelText: "Questão 3",
              hintText: "Titulo do seu quiz",
            ),
          ),
          TextField(
            style: AppTextStyles.title,
            decoration: InputDecoration(
              icon: Icon(Icons.question_answer),
              labelText: "Questão 4",
              hintText: "Titulo do seu quiz",
            ),
          ),
          SizedBox(height: 20,),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: NextButtonWidget.green(
                    label: "Salvar",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: NextButtonWidget.purple(
                    label: "Proxima Pergunta",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
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
    );
  }
}
