import 'package:quizcommunity/core/app_text_styles.dart';
import 'package:quizcommunity/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int lenght;

  QuestionIndicatorWidget({required this.currentPage,required this.lenght});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "de $lenght",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16,),
          ProgressIndicatorWidget(value: currentPage/lenght),
        ],
      ),
    );
  }
}
