import 'package:bloc/bloc.dart';

class AnswerCubit extends Cubit<List<Map<String, int>>> {
  AnswerCubit(): super([]);

  void setAnswer(Map<String, int> answer) => emit([...state, answer]);

  void reinitializeAnswer() => emit([]);
}