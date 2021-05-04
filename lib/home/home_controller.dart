import 'package:quizcommunity/core/app_images.dart';
import 'package:quizcommunity/home/home_repository.dart';
import 'package:quizcommunity/home/home_start.dart';
import 'package:quizcommunity/shared/models/awnser_model.dart';
import 'package:quizcommunity/shared/models/question_model.dart';
import 'package:quizcommunity/shared/models/quiz_model.dart';
import 'package:quizcommunity/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  HomeState get state => stateNotifier.value;

  set state(HomeState state) => stateNotifier.value = state;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repositoy = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repositoy.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repositoy.getQuizzes();
    state = HomeState.sucess;
  }
}
