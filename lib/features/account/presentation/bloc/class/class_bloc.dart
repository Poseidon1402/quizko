import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entity/class_entity.dart';
import '../../../domain/usecases/fetch_classes.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final FetchClasses fetchClasses;

  ClassBloc({required this.fetchClasses}) : super(InitialState()) {
    on<FetchClassesEvent>(_handleFetchClassesEvent);
  }

  void _handleFetchClassesEvent(
      FetchClassesEvent event, Emitter<ClassState> emit) async {
    emit(LoadingClassState());
    final result = await fetchClasses();
    result.fold(
      (failure) => emit(ErrorClassState(error: failure)),
      (classes) => emit(LoadedClassState(classes: classes)),
    );
  }
}
