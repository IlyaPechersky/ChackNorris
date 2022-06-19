import 'package:chack_noris_application/ui/alert_information.dart';
import 'package:chack_noris_application/ui/problems.dart';
import 'package:check_inet/check_inet.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  bool _internetActive = false;

  @override
  void initState() {
    super.initState();
  }

  void openMainJokes() {
    Navigator.pushReplacementNamed(context, '/main_jokes');
  }

  void openFavorites() {
    Navigator.pushReplacementNamed(context, '/favorites');
  }

  void openRules() {
    Navigator.pushReplacementNamed(context, '/rules');
  }

  @override
  Widget build(BuildContext context) {
    checkInternetAvailability();
    if (!_internetActive) {
      return const LostConnection();
    } else {
      return MaterialApp(
          home: Scaffold(
              backgroundColor: Colors.white12,
              appBar: AppBar(
                backgroundColor: Colors.black38,
                title: const Center(child: AlertInformationWidget()),
              ),
              body: Column(
                children: [
                  Container(
                      padding: EdgeInsets.zero,
                      margin: const EdgeInsets.only(top: 50, bottom: 0),
                      child: Image.asset('assets/cool-chuck.png')),
                  TextButton(
                      onPressed: () {
                        openMainJokes();
                      },
                      child: const Card(
                          margin: EdgeInsets.all(0),
                          color: Colors.blueGrey,
                          child: Text(
                            "Let's start, give me some jokes, Man!",
                            style: TextStyle(
                                fontFamily: 'KTF',
                                fontSize: 30,
                                color: Colors.white),
                          ))),
                  TextButton(
                      onPressed: () {
                        openRules();
                      },
                      child: const Card(
                          margin: EdgeInsets.all(0),
                          color: Colors.white30,
                          child: Text(
                            "I don't know how to use this App, help me!",
                            style: TextStyle(
                                fontFamily: 'KTF',
                                fontSize: 30,
                                color: Colors.white),
                          ))),
                ],
              )));
    }
  }

  Future<void> checkInternetAvailability() async {
    bool internetActive;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      internetActive = await CheckInet.checkInternet;
    } on Exception {
      internetActive = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _internetActive = internetActive;
    });
  }
}
