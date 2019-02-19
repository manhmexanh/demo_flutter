import 'package:alive/screens/basic_presenter.dart';
import 'package:flutter/material.dart';
import 'package:alive/data_repository/dict_repository.dart';
import 'package:alive/data_repository/dependency_injection.dart';

class SearchBarView {
  void updateSearchStatus() {}
  void getTextSearch(String text) {}
}

class SearchBarPresenter extends BasicPresenter {
  SearchBarView _searchBarView;
  SearchBarModel _searchBarModel = new SearchBarModel();

  SearchBarPresenter(this._searchBarView) {}

  @override
  Future loadData() async {
    assert(_searchBarView != null);
  }

  void updateSearchText(String text) {
    if (text.isNotEmpty) {
      _searchBarModel._textSearch = text;
      _searchBarModel._isSearching = true;
      _searchBarView.updateSearchStatus();
      _searchBarView.getTextSearch(_searchBarModel._textSearch);
    } else {
      _searchBarModel._isSearching = false;
      _searchBarView.updateSearchStatus();
    }
  }

  SearchBarView getSearchBarView() {
    return _searchBarView;
  }

  bool getSearchStatus() {
    return _searchBarModel._isSearching;
  }
}

class SearchBarModel {
  String _textSearch;
  bool _isSearching = false;
  SearchBarModel();
}
