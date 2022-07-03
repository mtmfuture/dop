import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../utility/CountriesList.dart';

class TimeZoneControler {
  String? _countryTimeZon;
  String? get countryTimeZon {
    return _countryTimeZon;
  }

  String? _fromatedCountryName;
  String? get fromatedCountryName {
    return _fromatedCountryName;
  }

  String? _todayName;
  String? get todayName {
    return _todayName;
  }

  String? _gmtTime;
  String? get gmtTime {
    return _gmtTime;
  }

  String? _todayFullDate;
  String? get todayFullDate {
    return _todayFullDate;
  }

  String? _countryCurrentHour;
  String? get countryCurrentHour {
    return _countryCurrentHour;
  }

  String? _countryCurrentMinit;
  String? get countryCurrentMinit {
    return _countryCurrentMinit;
  }

  void formatedCountryName(String country) {
    String countryName = country.split('/').first;
    String countryNameCapital = country.split('/').last;
    _fromatedCountryName = countryName + ", " + countryNameCapital;
  }

  Future<void> getSelectedCountryTimeZone(String countryName) async {
    String urlString =
        'https://worldtimeapi.org/api/timezone/${countryName.split(',').first}/${countryName.split(',').last.trim()}';
    print(urlString);
    try {
      Uri url = Uri.parse(urlString);
      http.Response response = await http.get(url);

      var data = json.decode(response.body);
      _countryTimeZon = data['datetime'];
      print(_countryTimeZon);
      _gmtTime = data['utc_offset'];
      var timeGMT = int.parse(_gmtTime.toString().split(':').first);
      var countryDateTime = DateTime.parse(_countryTimeZon.toString());

      final DateFormat formatFullDate = DateFormat('MMMM d, yyyy');
      _todayFullDate = formatFullDate.format(countryDateTime);

      final DateFormat formatToday = DateFormat('EEEE');
      _todayName = formatToday.format(countryDateTime);

      final DateFormat formatHourMinit = DateFormat('hh:mm');
      _countryCurrentHour = formatHourMinit
          .format(countryDateTime.add(Duration(hours: timeGMT)))
          .split(':')
          .first;
      _countryCurrentMinit =
          formatHourMinit.format(countryDateTime).split(':').last;
    } catch (e) {
      print(e);
    }
  }

  String? _localTimeDMMMMEEEE;
  String? get localTimeDMMMMEEEE {
    return _localTimeDMMMMEEEE;
  }

  String? _todayCurrentHour;
  String? get todayCurrentHour {
    return _todayCurrentHour;
  }

  String? _todayCurrentMinit;
  String? get todayCurrentMinit {
    return _todayCurrentMinit;
  }

  void getCurrentCountryLocalTimeZone() {
    DateTime localTimeNow = DateTime.now();
    final DateFormat localformatDate = DateFormat('d MMMM, EEEE');
    _localTimeDMMMMEEEE = localformatDate.format(localTimeNow);

    final DateFormat localformatHourMinit = DateFormat('hh:mm');
    _todayCurrentHour =
        localformatHourMinit.format(localTimeNow).split(':').first;
    _todayCurrentMinit =
        localformatHourMinit.format(localTimeNow).split(':').last;
  }
}
