import 'package:alive/model/word.dart';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

abstract class DictRepository {
  Future<List<Word>> fetchSuggessions(String text);

  List<Word> loadFakeData();

  Future<List<Word>> loadFakeJson();
}

class DictRepositorySQLite implements DictRepository {
  @override
  Future<List<Word>> fetchSuggessions(String text) async {
    return genRandomWords(text);
  }

  List<Word> genRandomWords(text) {
    int r = new Random().nextInt(10);
    List<Word> words = [];
    for (int i = 0; i < r; i++) {
      words.add(new Word('$text $i', '$text $i'));
    }
    return words;
  }

  @override
  List<Word> loadFakeData() {
    parseJsonFromAssets("data_repo/data.json").then((fakeData) {
      print("fakeData" + fakeData.toString());
      List<Word> words = new List();
      for (int index = 0; index < fakeData.length; index++) {
        String text = fakeData[index]['name'].toString();
        String translation = fakeData[index]['greeting'].toString();
        Word word = new Word(text, translation);
        words.add(word);
      }
      return words;
    }).catchError((err) {
      print("load fake data err" + err.toString());
    });
    return null;
  }

  Future<List<dynamic>> parseJsonFromAssets(String assetsPath) {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath).then((jsonStr) {
      return jsonDecode(jsonStr);
    });
  }

  @override
  Future<List<Word>> loadFakeJson() async {
    List<Word> words = new List();
    List<Word> xxx = await parseJsonFromAssets("data_repo/data.json").then((fakeData) {
      for (int index = 0; index < fakeData.length; index++) {
        String text = fakeData[index]['name'].toString();
        String translation = fakeData[index]['greeting'].toString();
        Word word = new Word(text, translation);
        words.add(word);
      }
      print(words.length.toString());
      return words;
    }).catchError((err) {
      print("load fake data err" + err.toString());
      return new List();
    });
  return xxx;
  }
}
