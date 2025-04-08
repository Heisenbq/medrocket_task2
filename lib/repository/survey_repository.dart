
import 'dart:async';

import '../model/survey.dart';

class SurveyRepository {
  Future<Survey> getSurvey() async {
    await Future.delayed(Duration(seconds: 3));
    return Survey(completionPercentage: 50.0);
  }
}
