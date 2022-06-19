import 'package:chack_noris_application/ui/alert_information.dart';
import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RulesPageState();
}

class RulesPageState extends State<RulesPage> {
  @override
  void initState() {
    super.initState();
  }

  void openMenu() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white12,
            appBar: AppBar(
              backgroundColor: Colors.black38,
              title: const Center(child: AlertInformationWidget()),
            ),
            body: Column(
              children: const [
                Text(
                    "Start getting funny jokes about Chuck by pressing the button on the main menu",
                    style: TextStyle(
                        fontFamily: 'KTF',
                        fontSize: 20,
                        color: Colors.white30)),
                Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.blueGrey,
                    child: Text(
                      "Let's start, give me some jokes, Man!",
                      style: TextStyle(
                          fontFamily: 'KTF', fontSize: 30, color: Colors.white),
                    )),
                Text(
                    "You can take the next random joke either by swiping the "
                    "last one, or by making a short press on Chuck's head",
                    style: TextStyle(
                        fontFamily: 'KTF',
                        fontSize: 20,
                        color: Colors.white30)),
                Text(
                    "\nOr make a long press, then the joke will be in the favorites.",
                    style: TextStyle(
                        fontFamily: 'KTF',
                        fontSize: 20,
                        color: Colors.white30)),
                Text(
                    "\nPress finger up to see your favorite jokes, they can also be deleted with swipes",
                    style: TextStyle(
                        fontFamily: 'KTF',
                        fontSize: 20,
                        color: Colors.white30)),
                Center(
                    child:
                        Icon(Icons.thumb_up, size: 40, color: Colors.blueGrey)),
                Text(
                    "You can scroll through the page with jokes and return back"
                    "by clicking on the arrow at the top of the screen",
                    style: TextStyle(
                        fontFamily: 'KTF',
                        fontSize: 20,
                        color: Colors.white30)),
                Center(
                    child: Icon(Icons.keyboard_return_rounded,
                        size: 40, color: Colors.blueGrey))
              ],
            ),
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
            )));
  }
}
