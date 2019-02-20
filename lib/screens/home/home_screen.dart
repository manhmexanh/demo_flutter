import 'package:flutter/material.dart';
import 'package:alive/screens/home/home_presenter.dart';
import 'package:alive/model/word.dart';
import 'dart:convert';
import 'package:alive/components/search_comp.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> implements HomeView {
  HomePresenter _presenter;
  Widget appBarTitle = new Text(
    "Search Example",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  @override
  void initState() {
    _presenter = new HomePresenter(this);
    _presenter.loadData();
  }

  void callBackTextSearch(String text) {
    _presenter.fetchSuggesstions(text);
  }

  @override
  void showSuguesstions(List<SearchItem> words) {
    // return new Row(
    //   children: words.map((word) => new Text(word.text)).toList(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new Column(
        children: <Widget>[
          Text("Dictionary"),
          new Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBarComp(
              callBackSearchText: this.callBackTextSearch,
            ),
          )
        ],
      ),
    );
  }

  // Build appbar
  Widget buildAppBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: appBarTitle,
    );
  }
}
