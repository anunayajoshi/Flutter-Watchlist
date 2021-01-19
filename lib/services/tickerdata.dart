import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TickerData {
  String url;
  double price;

  TickerData({this.url});

  Future<void> getPrice() async {
    try {
      // Await the http get response, then decode the json-formatted response.
      http.Response response = await http.get(
          'https://4ggbqfyrif.execute-api.us-west-2.amazonaws.com/api/quote/$url');
      if (response.statusCode == 200) {
        double jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        price = jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('caught error: $e');
      price = 0000;
    }
  }
}
