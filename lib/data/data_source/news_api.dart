import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsApi {
  final baseUrl =
      "https://congocheck.net/index.php/wp-json/wp/v2/posts?per_page=5&categories=104";
  Future<Map<String, dynamic>?> getNews() async {
    try {
      var responseBody = await http.get(Uri.parse(baseUrl),
          headers: {"content-type": "application/json"});
      print(responseBody.body);
      if (responseBody.statusCode == 200) {
        Map<String, dynamic> t = {'articles': responseBody.body};

        return jsonDecode(jsonEncode(t));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
