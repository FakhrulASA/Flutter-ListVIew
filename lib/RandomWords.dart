import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWords = <WordPair>[];
  final _savedWords = <WordPair>{};

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();
        final index = item ~/ 2;
        if (index >= _randomWords.length) {
          _randomWords.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWords[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWords.contains(pair);
    return ListTile(
      title: Text(
        pair.asCamelCase,
        style: TextStyle(fontSize: 20),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite :
        Icons.favorite_border,
        color: alreadySaved?Colors.red : null,
    ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _savedWords.remove(pair);
          }else{
            _savedWords.add(pair);
          }
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Word Generator"),
        actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon: Icon(Icons.menu))
        ],
      ),
      body: _buildList(),
    );
  }

  void _pushSaved(){

  }
}
