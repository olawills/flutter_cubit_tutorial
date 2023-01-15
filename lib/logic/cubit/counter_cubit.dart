import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterState(
          counterValue: 0,
          isPressed: 0,
        ));

  void incrementValue() => emit(CounterState(
        counterValue: state.counterValue + 1,
        wasIncremented: true,
        isPressed: state.counterValue + 1,
      ));
  void decrementValue() => emit(CounterState(
        counterValue: state.counterValue - 1,
        wasIncremented: false,
        isPressed: state.counterValue + 1,
      ));
}
