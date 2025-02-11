import 'dart:convert' as convert;
import 'dart:http/http.dart' as http;

Future getWeather(String location) async {
  var apiKey = '5b335f2bb16441bfb3804611250602';
  var url = Uri.https('api.weather.com', '/v1/current.json', {
    'key': apiKey,
    'q': location,
    'aqi': 'no',
  });

  var response = await http.get(url);
  if (response.statusCose == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    // TO DO declare variable for which data needs to be extracter from the json
    Map<String, dynamic> weatherData = {
      'location': jsonResponse['location']['name'],
      'region': jsonResponse['location']['name'],
      'country': jsonResponse['location']['country'],
      'localtime': jsonResponse['location']['localtime'],
      'condition': jsonResponse['current']['condition']['text'],
      'temp': jsonResponse['current']['temp_c'],
      'windSpeed': jsonResponse['current']['wind_mph'],
      'atmPressure': jsonResponse['current']['pressure_mb'],
      'humidity': jsonResponse['current']['humidity'],
      'cloudCover': jsonResponse['current']['cloud'],
      'windGust': jsonResponse['current']['gust_mph'],
    };

    return weatherData;
  } else {
    return {"error": "error"};
  }
}
