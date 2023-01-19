import 'package:fetching_data/models/covid_model.dart';
import 'package:fetching_data/src/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<dynamic> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
