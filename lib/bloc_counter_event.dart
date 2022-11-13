part of 'bloc_counter_bloc.dart';

@immutable
abstract class CounterEvent {}
class CounterIncrementEvent extends CounterEvent{
}