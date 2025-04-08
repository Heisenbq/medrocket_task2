
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_task2/bloc/survey_event.dart';
import 'package:home_task2/bloc/survey_state.dart';

import '../repository/survey_repository.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyRepository surveyRepository;

  SurveyBloc(this.surveyRepository) : super(SurveyInitial()) {
    on<FetchSurveyEvent>(_onFetchSurvey);
  }
  void _onFetchSurvey(FetchSurveyEvent event, Emitter<SurveyState> emit) async {
    emit(SurveyLoading());
    final survey = await surveyRepository.getSurvey();
    emit(SurveyLoaded(survey));
  }
}






