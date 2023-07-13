import 'dart:convert';

import 'package:test_project/model/model.dart';
import 'package:http/http.dart' as http;

//get response method from Api
Future<MainModel> getData() async {
  final response = await http.get(
    Uri.https(
      "dog.ceo",
      "/api/breeds/image/random",
    ),
  );

  if (response.statusCode == 200) {
    return MainModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception("Error: Can't load the data");
  }
}
