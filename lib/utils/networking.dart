import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Future<dynamic> _getResponse(String url) async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } 
  }

}