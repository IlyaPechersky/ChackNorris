import 'package:flutter/material.dart';

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