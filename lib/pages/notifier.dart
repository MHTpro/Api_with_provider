import 'package:flutter/widgets.dart';
import 'package:test_project/api/my_api.dart';
import 'package:test_project/model/model.dart';

class MyNotifier extends ChangeNotifier {
  bool loading = false;
  MainModel? response;

  Future<void> getResponse() async {
    //loading -- rebuild UI
    loading = true;
    notifyListeners();

    //get response with api method that exist in
    //(my_api.dart) file.
    final lastResponse = await getData();
    response = lastResponse;

    //loading -- rebuild UI
    loading = false;
    notifyListeners();
  }
}
