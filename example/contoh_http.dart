import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.http('localhost:8000', '/api/student');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var data = jsonResponse['data'];
    print(data);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  // var request =
  //     http.Request('GET', Uri.parse('http://localhost:8000/api/student'));

  // http.StreamedResponse response = await request.send();

  // if (response.statusCode == 200) {
  //   print(await response.stream.bytesToString());
  // } else {
  //   print(response.reasonPhrase);
  // }
}
