import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Data> fetchNetworkData() async {
  //should return text ui fuga est a eum
  final data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/8'));
  //shouldn`t return valid data, CircularProgressIndicator() will be shown
  // final data = await http.get(Uri.parse('https://context.reverso.net/'));
  if (data.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return Data.parseJson(jsonDecode(data.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load data');
  }
}

class Data {
  final int userId;
  final int id;
  final String title;

  Data({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Data.parseJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
