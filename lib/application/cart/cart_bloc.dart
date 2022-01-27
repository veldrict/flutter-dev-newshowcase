import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Initial()) {
    on<CartEvent>((event, emit) async {
      await event.when(
        started: () async {},
        addOrRemoveItem: (isAdd, productId) async {},
        removeCart: () async {},
      );
    });
  }
}
