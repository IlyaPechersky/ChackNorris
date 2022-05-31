import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

@freezed
class Joke {
  String? joke_data;

  Joke(String? joke_data) {
    this.joke_data = joke_data;
  }

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(json['value']);

  @override
  String toString() {
    return joke_data ?? 'smth goes wrong!';
  }
}
