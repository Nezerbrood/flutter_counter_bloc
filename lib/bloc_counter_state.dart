part of 'bloc_counter_bloc.dart';

@immutable
abstract class CounterState {}
class CounterInitial extends CounterState {
  int counter;
  CounterInitial({required this.counter});
}
