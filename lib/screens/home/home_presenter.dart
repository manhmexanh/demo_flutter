import 'package:alive/screens/basic_presenter.dart';
import 'package:alive/data_repository/dependency_injection.dart';
import 'package:alive/data_repository/dict_repository.dart';
import 'package:alive/model/word.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:alive/model/models.dart';

abstract class HomeView {
  void showSuguesstions(List<SearchItem> words);
}

class HomePresenter extends BasicPresenter {
  HomeView _view;
  DictRepository _repository;
  List<Word> _list;

  HomePresenter(this._view) {
    _repository = new Injector().getDictRepository();
  }

  @override
  Future loadData() async {
    assert(_view != null);
    _repository.loadFakeJson().then((List<Word> words) {
      _list = words;
      print(_list[0].text.toString());
    }).catchError((err) {
      print(err.toString());
    });
  }

  void fetchSuggesstions(String text) {
    // TODO: get recent searches and all words related to input text
    List<SearchItem> searchResult = new List();
    // for (int i = 0; i < _list.length; i++) {
    //   Word word = _list[i];
    //   if (word.text.toLowerCase().contains(text.toLowerCase())) {
    //     searchResult.add(word);
    //   }
    // }
    if (searchResult.length > 0) {
      _view.showSuguesstions(searchResult);
    }
    print("search result numbers " + searchResult.length.toString());
  }
}

enum SearchItemType {
    RECENT_SEARCH, RELATED_SEARCH
}

class SearchItem {

  String content;
  int type;

  SearchItem(this.content, this.type);
}

