import 'package:alive/screens/basic_presenter.dart';
import 'package:alive/data_repository/dependency_injection.dart';
import 'package:alive/data_repository/dict_repository.dart';
import 'package:alive/model/word.dart';

abstract class HomeView {
  void showSuguesstions(List<Word> words);
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

  void getSuggesstion(String text) {
    _repository.fetchSuggessions(text).then((words) => _view.showSuguesstions(words));
  }

  void doSearch(String text) {
  }

}