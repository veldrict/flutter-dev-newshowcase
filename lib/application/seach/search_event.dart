part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.onSearch({required String input}) = _OnSearch;
}
