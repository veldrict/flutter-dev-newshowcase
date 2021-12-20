import 'package:bloc/bloc.dart';
import 'package:flutter_dev_newshowcase/domain/pin/pin_object.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pin_event.dart';
part 'pin_state.dart';
part 'pin_bloc.freezed.dart';

@injectable
class PinBloc extends Bloc<PinEvent, PinState> {
  PinBloc() : super(PinState.initial()) {
    on<PinEvent>((event, emit) async {
      await event.when(
        started: () async {},
        onChangePIN: (pin) async {},
      );
    });
  }
}
