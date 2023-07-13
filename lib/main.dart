import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/notifier.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //provider
    return ChangeNotifierProvider(
      //data
      create: (context) => MyNotifier(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
