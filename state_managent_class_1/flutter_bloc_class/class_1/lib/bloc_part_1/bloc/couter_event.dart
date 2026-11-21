part of 'couter_bloc.dart';

sealed class CounterEvent {}

class CounterIncrementedEvent extends CounterEvent {}

class CounterDecrementedEvent extends CounterEvent {}

class CounterResetEvent extends CounterEvent {}
