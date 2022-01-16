import 'package:firstproject/RandomWords.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final words = WordPair.random();
    return MaterialApp(home: RandomWords());
  }
}
