import 'package:quizcommunity/core/app_colors.dart';
import 'package:quizcommunity/core/app_images.dart';
import 'package:quizcommunity/core/app_text_styles.dart';
import 'package:quizcommunity/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final String image;
  final VoidCallback onTap;

  const QuizCardWidget({
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.love),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    completed,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(
                   value: percent,
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