part of 'covid_bloc.dart';

abstract class CovidEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCovidList extends CovidEvent {}
