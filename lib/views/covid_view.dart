import 'dart:developer';

import 'package:fetching_data/blocs/covid_bloc/covid_bloc.dart';
import 'package:fetching_data/models/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidView extends StatefulWidget {
  const CovidView({Key? key}) : super(key: key);

  @override
  State<CovidView> createState() => _CovidViewState();
}

class _CovidViewState extends State<CovidView> {
  final CovidBloc covidBloc = CovidBloc();
  @override
  void initState() {
    covidBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('COVID-19 List')),
      body: _buildListCovid(),
    );
  }

// _buildListCovid
  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => covidBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              log('message: ${state.errorMsg}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMsg),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (BuildContext context, state) {
              if (state is CovidInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CovidLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CovidGetData) {
                log('inside build: ${state.covidModel}');
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, model) {
    log('object: ${model[0]['totalConfirmed']}');
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Country: ${model[index]['Country']}"),
                  Text("Total Confirmed: ${model[index]['TotalConfirmed']}"),
                  Text("Total Deaths: ${model[index]['TotalDeaths']}"),
                  Text("Total Recovered: ${model[index]['TotalRecovered']}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
