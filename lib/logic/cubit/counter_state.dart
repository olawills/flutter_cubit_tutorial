part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool? wasIncremented;
  final int? isPressed;

  const CounterState(
      {required this.counterValue, this.wasIncremented, this.isPressed});

  @override
  List<Object?> get props => [
        counterValue,
        isPressed,
        wasIncremented,
      ];
}
