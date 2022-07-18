import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._dataRepository) : super(SearchState.initial()) {
    on<QueryChanged>((event, emit) {
      emit(state.copyWith(
        query: event.query,
      ));
    });

    on<SearchPressed>((event, emit) async {
       // TODO: implement searchPressed
    });
  }

  final DataRepositoryInterface _dataRepository;
}
