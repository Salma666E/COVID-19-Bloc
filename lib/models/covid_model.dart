class CovidModel {
  String? iD;
  String? message;
  List<Countries>? countries;
  String? date;
  CovidModel.withError(String msg) {
    print('msg');
  }
  CovidModel({this.iD, this.message, this.countries, this.date});

  CovidModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'] ?? '';
    message = json['Message'] ?? '';
    if (json['Countries'] != null) {
      countries = <Countries>[];
      json['Countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Message'] = this.message;

    if (this.countries != null) {
      data['Countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    data['Date'] = this.date;
    return data;
  }
}

class Global {
  int? Confirmed;
  int? totalConfirmed;
  int? Deaths;
  int? totalDeaths;
  int? Recovered;
  int? totalRecovered;
  String? date;

  Global(
      {this.Confirmed,
      this.totalConfirmed,
      this.Deaths,
      this.totalDeaths,
      this.Recovered,
      this.totalRecovered,
      this.date});

  Global.fromJson(Map<String, dynamic> json) {
    Confirmed = json['Confirmed'];
    totalConfirmed = json['TotalConfirmed'];
    Deaths = json['Deaths'];
    totalDeaths = json['TotalDeaths'];
    Recovered = json['Recovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Confirmed'] = this.Confirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['Deaths'] = this.Deaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['Recovered'] = this.Recovered;
    data['TotalRecovered'] = this.totalRecovered;
    data['Date'] = this.date;
    return data;
  }
}

class Countries {
  String? iD;
  String? country;
  String? countryCode;
  String? slug;
  int? Confirmed;
  int? totalConfirmed;
  int? Deaths;
  int? totalDeaths;
  int? Recovered;
  int? totalRecovered;
  String? date;

  Countries(
      {this.iD,
      this.country,
      this.countryCode,
      this.slug,
      this.Confirmed,
      this.totalConfirmed,
      this.Deaths,
      this.totalDeaths,
      this.Recovered,
      this.totalRecovered,
      this.date});
Countries.withError(String msg) {
    print('msg');
  }
  Countries.fromJson(Map<String, dynamic> json) {
    iD = json['ID'] ?? '';
    country = json['Country'] ?? '';
    countryCode = json['CountryCode'] ?? '';
    slug = json['Slug'] ?? '';
    Confirmed = json['Confirmed'] ?? 0;
    totalConfirmed = json['TotalConfirmed'] ?? 0;
    Deaths = json['Deaths'] ?? 0;
    totalDeaths = json['TotalDeaths'] ?? 0;
    Recovered = json['Recovered'] ?? 0;
    totalRecovered = json['TotalRecovered'] ?? 0;
    date = json['Date'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Country'] = this.country;
    data['CountryCode'] = this.countryCode;
    data['Slug'] = this.slug;
    data['Confirmed'] = this.Confirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['Deaths'] = this.Deaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['Recovered'] = this.Recovered;
    data['TotalRecovered'] = this.totalRecovered;
    data['Date'] = this.date;

    return data;
  }
}

class Premium {
  Premium();

  Premium.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    return data;
  }
}
