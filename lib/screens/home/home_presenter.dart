import 'package:alive/screens/basic_presenter.dart';
import 'package:alive/data_repository/dependency_injection.dart';
import 'package:alive/data_repository/dict_repository.dart';
import 'package:alive/model/word.dart';

abstract class HomeView {
  void showSuggestions(List<Word> words);
}

class HomePresenter extends BasicPresenter {

  HomeView _view;
  DictRepository _repository;

  HomePresenter(this._view) {
    _repository = new Injector().getDictRepository();
  }

  @override
  void loadData() {
    assert(_view != null);
  }

  void getSuggestions(String text) {
    _repository.fetchSuggesions(text).then((words) => _view.showSuggestions(words));
  }

  void doSearch(String text) {
  }
}