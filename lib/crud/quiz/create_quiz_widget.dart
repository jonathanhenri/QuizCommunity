import 'package:flutter/material.dart';
import 'package:quizcommunity/challenger/widgets/next_button/next_button_widget.dart';
import 'package:quizcommunity/crud/quiz/app_bar_create_quiz.dart';
import 'package:quizcommunity/crud/quiz/create_question_widget.cart.dart';
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
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               CreateAwanserWidget.isRight(title: "Resposta 1"),
               CreateAwanserWidget.isWrong(title: "Resposta 2"),
               CreateAwanserWidget.isWrong(title: "Resposta 3"),
               CreateAwanserWidget.isWrong(title: "Resposta 4"),
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
                           Navigator.pushReplacement(
                             context,
                             MaterialPageRoute(
                               builder: (context) => HomePage(),
                             ),
                           );
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
}
