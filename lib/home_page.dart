import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _chuckJoke = [];
  final chuckURL = 'https://api.chucknorris.io/jokes/random';

  @override
  void initState() {
    super.initState();
    getHttp().then((value) => setState(() {
      _chuckJoke.add(value);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Chuck Norris App',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
              centerTitle: true,
            ),
            body: Center(
                child: ListView.builder(
                    itemCount: _chuckJoke.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(_chuckJoke[index]),
                        child: Card(
                            child: Text(
                          _chuckJoke[index],
                          style: const TextStyle(fontSize: 30),
                        )),
                        onDismissed: (direction) {
                          _chuckJoke.removeAt(0);
                          getHttp().then((value) => setState(() {
                            _chuckJoke.add(value);
                          }));
                        },
                      );
                    }))));
  }

  Future<String> getHttp() async {
    var response =
        await http.get(chuckURL, headers: {'Accept': 'application/json'});
    return jsonDecode(response.body)['value'];
  }
}
