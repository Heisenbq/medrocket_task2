
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_task2/repository/survey_repository.dart';

import 'bloc/survey_bloc.dart';
import 'bloc/survey_event.dart';
import 'bloc/survey_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurveyBloc(SurveyRepository()),
      child: MaterialApp(
        home: SurveyScreen(),
      ),
    );
  }
}

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Progress'),
      ),
      body: Center(
        child: BlocBuilder<SurveyBloc, SurveyState>(
          builder: (context, state) {
            if (state is SurveyInitial) {
              return Text('Please start fetching the survey.');
            } else if (state is SurveyLoading) {
              return CircularProgressIndicator();
            } else if (state is SurveyLoaded) {
              return Text(
                'Survey Completion: ${state.survey.completionPercentage}%',
                style: TextStyle(fontSize: 24),
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<SurveyBloc>(context).add(FetchSurveyEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
