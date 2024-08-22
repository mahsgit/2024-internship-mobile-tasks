import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  testApi();
}

Future<void> testApi() async {
  final url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyCJJDJnHk6kPtYs1pT6WKqLF37AS0nM9LE';
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'contents': [
      {
        'parts': [
          {'text': 'Explain how AI works'}
        ]
      }
    ]
  });

  final response = await http.post(Uri.parse(url), headers: headers, body: body);
  
  if (response.statusCode == 200) {
    print('Response: ${response.body}');
  } else {
    print('Error: ${response.statusCode} - ${response.reasonPhrase}');
  }
}

