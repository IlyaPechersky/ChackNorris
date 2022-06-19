// @dart=2.9

import 'package:chack_noris_application/ui/main_jokes_page.dart';
import 'package:chack_noris_application/ui/favorite_jokes_page.dart';
import 'package:chack_noris_application/ui/menu_page.dart';
import 'package:chack_noris_application/ui/problems.dart';
import 'package:chack_noris_application/ui/rules_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(const ChuckNorrisApp());

class ChuckNorrisApp extends StatelessWidget {
  const ChuckNorrisApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final futureFirebase = Firebase.initializeApp();
    return FutureBuilder(
        future: futureFirebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SomethingWentWrong();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const MenuPage(),
                '/main_jokes': (context) => const MainJokesPage(),
                '/favorites': (context) => const FavoriteJokesPage(),
                '/rules': (context) => const RulesPage(),
                '/lost_network': (context) => const LostConnection()
              },
            );
          }
          return const Loading();
        });
  }
}
