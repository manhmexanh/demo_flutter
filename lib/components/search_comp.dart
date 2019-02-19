import 'package:flutter/material.dart';
import 'search_presenter.dart';
typedef void StringCallback(String value);
class SearchBarComp extends StatefulWidget {
  StringCallback callBackSearchText;
  SearchBarComp({this.callBackSearchText,Key key}) : super(key: key);
  @override
  _SearchBarCompState createState() => _SearchBarCompState();
}

class _SearchBarCompState extends State<SearchBarComp> implements SearchBarView  {
  SearchBarPresenter _searchBarPresenter;
  final _searchController = new TextEditingController();
  _SearchBarCompState() {
    _searchController.addListener(() {
      _searchBarPresenter.updateSearchText(_searchController.text);
    });
  }
  @override
  void initState() {
    super.initState();
    _searchBarPresenter = new SearchBarPresenter(this);
  }

  Widget renderSuffixIcon(BuildContext context) {
    print(_searchBarPresenter.getSearchStatus().toString());
    if(_searchBarPresenter.getSearchStatus()) {

      return new IconButton(icon: Icon(Icons.cancel), onPressed: () {
       // deleteSearchWord();
      });
    }
    return new IconButton(icon: Icon(Icons.mic), onPressed: null);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textInputAction: TextInputAction.search,
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: renderSuffixIcon(context),
          border: OutlineInputBorder(),
          hintText: "Enter spanish or English text",
        ),
      ),
    );
  }


  @override
  void updateSearchStatus() {
    setState(() {
      //_isSearching = _searchBarPresenter.getSearchStatus();
    });
  }

  @override
  void getTextSearch(String text) {
    this.widget.callBackSearchText(text);
  }
}
