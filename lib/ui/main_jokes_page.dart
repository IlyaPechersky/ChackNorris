import 'dart:convert';
import 'package:chack_noris_application/ui/alert_information.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:chack_noris_application/logic/jokes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:vibration/vibration.dart';

class MainJokesPage extends StatefulWidget {
  const MainJokesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainJokesPageState();
}

class MainJokesPageState extends State<MainJokesPage> {
  final List<Joke> _chuckJoke = [];
  final chuckURL = 'https://api.chucknorris.io/jokes/random';

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // FirebaseCrashlytics.instance.crash();
  }

  @override
  void initState() {
    super.initState();

    initFirebase();

    getHttp().then((value) => setState(() {
          _chuckJoke.add(value);
        }));
  }

  void openFavorites() {
    Navigator.pushReplacementNamed(context, '/favorites');
  }

  void openMenu() {
    Navigator.pushReplacementNamed(context, '/');
  }

  String getJoke(int index) {
    if (_chuckJoke.isNotEmpty) {
      return _chuckJoke[index].toString();
    } else {
      return "Check your network connection";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: const AlertInformationWidget(),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 19, 0),
              child: IconButton(
                  onPressed: () {
                    openFavorites();
                  },
                  icon: const Icon(Icons.thumb_up,
                      size: 40, color: Colors.blueGrey)),
            )
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: FractionallySizedBox(
                      child: SafeArea(
                          child: ListView.builder(
                              itemCount: _chuckJoke.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                  key: Key(getJoke(index)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
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
                                      getHttp().then((value) => setState(() {
                                            _chuckJoke.add(value);
                                          }));
                                    }
                                  },
                                );
                              }))))),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: GestureDetector(
                      onTap: () {
                        if (_chuckJoke.isNotEmpty) {
                          _chuckJoke.removeAt(0);
                          getHttp().then((value) => setState(() {
                                _chuckJoke.add(value);
                              }));
                        }
                      },
                      onLongPress: () {
                        if (_chuckJoke.isNotEmpty) {
                          FirebaseFirestore.instance
                              .collection('jokes')
                              .add({'joke': _chuckJoke[0].toString()});

                          _chuckJoke.removeAt(0);
                          getHttp().then((value) => setState(() {
                                _chuckJoke.add(value);
                              }));
                          Vibration.vibrate();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.asset('assets/chuck-head.png'),
                      ))))
        ]),
        bottomSheet: Container(
          color: Colors.black38,
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            child: const Text('Back to menu',
                style: TextStyle(
                    fontFamily: 'KTF', fontSize: 20, color: Colors.white)),
            onPressed: () {
              openMenu();
            },
          ),
        ),
      ),
    );
  }

  Future<Joke> getHttp() async {
    var response =
        await http.get(chuckURL, headers: {'Accept': 'application/json'});
    return Joke.fromJson(jsonDecode(response.body));
  }
}
