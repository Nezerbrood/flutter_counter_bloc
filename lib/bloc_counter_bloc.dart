import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_counter_event.dart';
part 'bloc_counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter;
  CounterBloc({required this.counter}) : super(CounterInitial(counter: 0)) {
    on<CounterIncrementEvent>((event, emit) {
      counter++;
      emit(CounterInitial(counter: counter));
    });
  }
}
