import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'choice_chip_event.dart';

class ChoiceChipBloc extends Bloc<ChoiceChipEvent, int> {
  ChoiceChipBloc() : super(0) {
    on<ChoiceChipInitialEvent>((event, emit) {
      emit(event.defaultChoiceIndex);
    });

    //while choice chip switch is onPressed
    on<ChoiceChipSwitchEvent>((event, emit) {
      emit(event.choiceIndex);
    });
  }
}
