import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fetching_data/models/covid_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<dynamic> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      log('response: ${response.data}');
      // List<Countries>.fromJson(response.data);
      return response.data['Countries'] ;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Countries.withError("Data not found / Connection issue");
    }
  }
}
