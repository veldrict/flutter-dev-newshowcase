import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.initial()) {
    on<_OnSearch>(
      (event, emit) async {},
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 300))
            .switchMap(mapper);
      },
    );
  }
}
