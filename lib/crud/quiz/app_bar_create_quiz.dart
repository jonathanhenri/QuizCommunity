import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizcommunity/core/app_gradients.dart';
import 'package:quizcommunity/core/app_text_styles.dart';
import 'package:quizcommunity/shared/models/user_model.dart';

class AppBarCreateQuizWidget extends PreferredSize {

  AppBarCreateQuizWidget()
      : super(
          preferredSize: Size.fromHeight(200),
          child: Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: "Hora criar um super Quiz!",
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
