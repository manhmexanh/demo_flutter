import 'package:alive/model/word.dart';
import 'dart:math';

abstract class DictRepository {
  Future<List<Word>> fetchSuggesions(String text);
}

class DictRepositorySQLite implements DictRepository {

  @override
   Future<List<Word>> fetchSuggesions(String text) async {
     return genRandomWords(text);
   }

   List<Word> genRandomWords(text) {
    int r = new Random().nextInt(10);
    List<Word> words = [];
    for(int i =0;i<r;i++) {
      words.add(new Word('$text $i', '$text $i'));
    }
    return words;
   }
}