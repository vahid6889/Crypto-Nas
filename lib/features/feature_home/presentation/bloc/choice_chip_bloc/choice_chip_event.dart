part of 'choice_chip_bloc.dart';

@immutable
abstract class ChoiceChipEvent extends Equatable {}

class ChoiceChipInitialEvent extends ChoiceChipEvent {
  final int defaultChoiceIndex = 0;
  @override
  List<Object?> get props => [defaultChoiceIndex];
}

class ChoiceChipSwitchEvent extends ChoiceChipEvent {
  final int choiceIndex;

  ChoiceChipSwitchEvent(this.choiceIndex);
  @override
  List<Object?> get props => [choiceIndex];
}
