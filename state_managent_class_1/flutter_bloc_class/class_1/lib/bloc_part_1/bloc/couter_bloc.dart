import 'package:flutter_bloc/flutter_bloc.dart';

part 'couter_event.dart';

class CouterBloc extends Bloc<CounterEvent, int> {
  CouterBloc() : super(0) {
    on<CounterIncrementedEvent>((event, emit) {
      emit(state + 1);
    });
    on<CounterDecrementedEvent>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });

    on<CounterResetEvent>((event, emit) {
      emit(0);
    });
  }
}
