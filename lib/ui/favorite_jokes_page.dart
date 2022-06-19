import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chack_noris_application/ui/alert_information.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FavoriteJokesPage extends StatefulWidget {
  const FavoriteJokesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FavoriteJokesState();
}

class FavoriteJokesState extends State<FavoriteJokesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
    // FirebaseCrashlytics.instance.crash();
  }

  void returnBack() {
    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, '/main_jokes', (route) => false);
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
        title: const AlertInformationWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 19, 0),
            child: IconButton(
                onPressed: () {
                  returnBack();
                },
                icon: const Icon(Icons.keyboard_return_rounded,
                    size: 40, color: Colors.blueGrey)),
          )
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('jokes').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Card(
                  color: Colors.blueGrey,
                  child: Text(
                    "Wait a little, man",
                    style: TextStyle(
                        fontFamily: 'KTF', fontSize: 30, color: Colors.white),
                  ));
            }
            return LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(snapshot.data?.docs[index].id ??
                            "smth goes wrong..."),
                        child: Card(
                            color: Colors.blueGrey,
                            child: Text(
                              snapshot.data?.docs[index].get('joke') ??
                                  "smth goes wrong...",
                              style: const TextStyle(
                                  fontFamily: 'KTF',
                                  fontSize: 30,
                                  color: Colors.white),
                            )),
                        onDismissed: (direction) {
                          FirebaseFirestore.instance
                              .collection('jokes')
                              .doc(snapshot.data?.docs[index].id)
                              .delete();
                        },
                      );
                    });
              },
            );
          }),
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
    ));
  }
}
