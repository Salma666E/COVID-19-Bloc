import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:fetching_data/models/covid_model.dart';
import 'package:fetching_data/src/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetCovidList>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList = await _apiRepository.fetchCovidList();
        log('mList: $mList');
        emit(CovidGetData(mList));
        if (mList == null) {
          emit(CovidError(mList.toString()));
        }
      } on NetworkError {
        emit(const CovidError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
