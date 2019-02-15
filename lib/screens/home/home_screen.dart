import 'package:flutter/material.dart';
import 'package:alive/screens/home/home_presenter.dart';
import 'package:alive/model/word.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> implements HomeView {

  HomePresenter _presenter;
  
  @override
  void initState() {
    _presenter = new HomePresenter(this);
    _presenter.loadData();
  }

  @override
  void showSuguesstions(List<Word> words){
    print('showSuguesstions ${words.length}');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: _createBodyView(),
    );
  }

  Widget _createBodyView() {
    return new Scaffold(
      body: new Center(
        child: TextField(
          onChanged: (text) => _presenter.getSuggesstion(text),
          onSubmitted: (text) => _presenter.doSearch(text),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Please enter a search term'
          ),
        )
      )
    );
  }
}