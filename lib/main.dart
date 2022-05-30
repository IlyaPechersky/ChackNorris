// @dart=2.9

import 'package:chack_noris_application/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChuckNorrisApp());

class ChuckNorrisApp extends StatelessWidget {
  const ChuckNorrisApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
