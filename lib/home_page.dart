import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:chack_noris_application/jokes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Joke> _chuckJoke = [];
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
            backgroundColor: Colors.white12,
            appBar: AppBar(
              backgroundColor: Colors.black38,
              title: AlertInformationWidget(),
              centerTitle: true,
            ),
            body: Column(children: <Widget>[
              Expanded(
                  child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: FractionallySizedBox(
                          child: SafeArea(
                              child: ListView.builder(
                                  itemCount: _chuckJoke.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Dismissible(
                                      key: Key(_chuckJoke[index].toString()),
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Card(
                                              color: Colors.blueGrey,
                                              child: Text(
                                                _chuckJoke[index].toString(),
                                                style: const TextStyle(
                                                    fontFamily: 'KTF',
                                                    fontSize: 30,
                                                    color: Colors.white),
                                              ))),
                                      onDismissed: (direction) {
                                        if (_chuckJoke.isNotEmpty) {
                                          _chuckJoke.removeAt(0);
                                          getHttp()
                                              .then((value) => setState(() {
                                                    _chuckJoke.add(value);
                                                  }));
                                        }
                                      },
                                    );
                                  }))))),
              SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: TextButton(
                          onPressed: () {
                            if (_chuckJoke.isNotEmpty) {
                              _chuckJoke.removeAt(0);
                              getHttp().then((value) => setState(() {
                                    _chuckJoke.add(value);
                                  }));
                            }
                          },
                          child: Image.asset('assets/chuck-head.png'))))
            ])));
  }

  Future<Joke> getHttp() async {
    var response =
        await http.get(chuckURL, headers: {'Accept': 'application/json'});
    return Joke.fromJson(jsonDecode(response.body));
  }
}

class AlertInformationWidget extends StatelessWidget {
  const AlertInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: const Text(
                    'Pechersky Ilya, i.pechersky@innopolis.university'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Ok'),
                    child: const Text('I invite you to Yandex, bro!',
                        style: TextStyle(color: Colors.blueGrey)),
                  )
                ],
              ),
            ),
        child: Text(
          'Chuck Norris App',
          style: TextStyle(
              fontFamily: 'KTF',
              fontSize: 35,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey),
        ));
  }
}
