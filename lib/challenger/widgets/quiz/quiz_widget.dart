import 'package:quizcommunity/challenger/widgets/awnser/awnser_widget.dart';
import 'package:quizcommunity/core/app_text_styles.dart';
import 'package:quizcommunity/shared/models/awnser_model.dart';
import 'package:quizcommunity/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel questionModel;
  final ValueChanged<bool> onSelected;

  QuizWidget({required this.questionModel, required this.onSelected});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelect = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.questionModel.title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.questionModel.awnsers.length; i++)
            AwanserWidget(
              isSelect: indexSelect == i,
              disabled: indexSelect != -1,
              awnserModel: widget.questionModel.awnsers[i],
              onTap: (value) {
                indexSelect = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              },
            ),
        ],
      ),
    );
  }
}
