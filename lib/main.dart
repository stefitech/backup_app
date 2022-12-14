// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BackupsLog App 1.0.0'),
        ),
        body: Center(

          child: RandomWords(),
        ),
      ),
    );
  }
}
class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
   final _suggestions = <WordPair>[];
   final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build (BuildContext context) {
   //final wordPair = WordPair.random();//
   //return Text(wordPair.asPascalCase);//
    return Scaffold(
      appBar: AppBar(
        title: Text('Randoms Backups Name for OPHID'),
      ),
      body: _buildSuggestions(),
    );
  }


   Widget _buildSuggestions() {
     return ListView.builder(
       padding: const EdgeInsets.all(16),
       itemBuilder: /*1*/ (context, i) {
         if (i.isOdd) return const Divider(); /*2*/

         final index = i ~/ 2; /*3*/
         if (index >= _suggestions.length) {
           _suggestions.addAll(generateWordPairs().take(10)); /*4*/
         }
         return ListTile(
           title: Text(
             _suggestions[index].asPascalCase,
             style: _biggerFont,
           ),
         );
       },
     );
   }

   }



