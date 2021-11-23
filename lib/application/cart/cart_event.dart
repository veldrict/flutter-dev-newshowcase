part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;
  const factory CartEvent.addOrRemoveItem({
    required bool isAdd,
    required int productId,
  }) = _AddNewItem;
  const factory CartEvent.removeCart() = _RemoveCart;
}
