part of 'covid_bloc.dart';

abstract class CovidState extends Equatable {
  const CovidState();
  @override
  List<Object?> get props => [];
}

class CovidInitial extends CovidState {}

class CovidLoading extends CovidState {}

class CovidGetData extends CovidState {
  final  covidModel;
  const CovidGetData(this.covidModel);
}

class CovidError extends CovidState {
  final String errorMsg;
  const CovidError(this.errorMsg);
}
