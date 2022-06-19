import 'package:chack_noris_application/main.dart';
import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text(
          'Chuck Norris App',
          style: TextStyle(
              fontFamily: 'KTF',
              fontSize: 35,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 19, 0),
            child: IconButton(
                onPressed: () {
                  runApp(const ChuckNorrisApp());
                },
                icon: const Icon(Icons.refresh,
                    size: 40, color: Colors.blueGrey)),
          )
        ],
      ),
      body: Container(
        // alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: const Text(
          'Hmm, something went wrong...',
          style:
              TextStyle(fontFamily: 'KTF', fontSize: 30, color: Colors.white12),
        ),
      ),
    ));
  }
}

class LostConnection extends StatelessWidget {
  const LostConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text(
          'Chuck Norris App',
          style: TextStyle(
              fontFamily: 'KTF',
              fontSize: 35,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 19, 0),
            child: IconButton(
                onPressed: () {
                  runApp(const ChuckNorrisApp());
                },
                icon: const Icon(Icons.refresh,
                    size: 40, color: Colors.blueGrey)),
          )
        ],
      ),
      body: Container(
        // alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: const Text(
          'The internet connection is lost, check the connection and run the application again',
          style:
              TextStyle(fontFamily: 'KTF', fontSize: 30, color: Colors.white12),
        ),
      ),
    ));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: const Text(
            'Chuck Norris App',
            style: TextStyle(
                fontFamily: 'KTF',
                fontSize: 35,
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 19, 0),
              child: IconButton(
                  onPressed: () {
                    runApp(const ChuckNorrisApp());
                  },
                  icon: const Icon(Icons.refresh,
                      size: 40, color: Colors.blueGrey)),
            )
          ],
        ),
        body: Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              value: 0.8,
              color: Colors.blueGrey,
            )),
      ),
    );
  }
}
