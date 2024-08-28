import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app_watchlist/api/api_constants.dart';
import 'package:movies_app_watchlist/model/sourceResponse.dart';

class ApiManger {
  /// http://api.themoviedb.org/3/discover/movie?api_key=5c4ab668b02b5dc8c81307a039494308

  /*
  Future<Map> getJson() async {
  var apiKey = getApiKey();
  var url = 'http://api.themoviedb.org/3/discover/movie?api_key=5c4ab668b02b5dc8c81307a039494308';
  var response = await http.get(url);
  return json.decode(response.body);
}
   */

  static Future<SourceResponse?> getResults() async {
    Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.resultsApi,
        {'apiKey': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
