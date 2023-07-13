import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //A bit Delay for creating Ui first of all.
    Future.delayed(Duration.zero).then(
      (value) {
        //get data from Provider
        final data = Provider.of<MyNotifier>(context, listen: false);
        //The method that we create in (Notifier.dart) file
        //to get api's data from our provider class
        data.getResponse();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          //use Consumer widget to show data from provider.
          //value == data
          child: Consumer<MyNotifier>(
            builder: (BuildContext context, MyNotifier value, _) {
              //if the data not ready to show and
              //still loading...
              return value.loading || value.response == null
                  ? const CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.grey,
                    )

                  //the data is ready...
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "This is Data:",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),

                        //Random pictures of dogs from Api
                        SizedBox(
                          width: 300,
                          height: 200,
                          child: Image.network(
                            "${value.response!.message}",
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
