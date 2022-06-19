import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Joke {
  String? jokeData;

  Joke(String? joke_data) {
    this.jokeData = joke_data;
  }

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(json['value']);

  @override
  String toString() {
    return jokeData ?? 'smth goes wrong!';
  }
}
