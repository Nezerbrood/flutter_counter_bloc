import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'bloc_counter_bloc.dart';

part 'system_event.dart';
part 'system_state.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState> {
  CounterBloc counterBloc;
  SystemBloc(this.counterBloc) : super(SystemInitial()) {
    counterBloc.stream.listen((state) {
        print("in systemBloc .listen");
        if (state is CounterInitial){
          if(state.counter==10){
            add(SystemShowMessageEvent());
          }
        }
    });
    on<SystemShowMessageEvent>((event, emit) {
      emit(SystemInitial());
    });
  }
}
