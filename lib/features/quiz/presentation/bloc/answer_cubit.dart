import 'package:bloc/bloc.dart';

// Key: Question id
// value: {'answer_id': _picked}
class AnswerCubit extends Cubit<Map<int, Map<String, int>>> {
  AnswerCubit(): super({});

  void setAnswer(int id, Map<String, int> answer) {
    state[id] = answer;
    emit(state);
  }

  void reinitializeAnswer() => emit({});
}