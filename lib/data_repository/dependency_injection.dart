import 'dict_repository.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  DictRepository getDictRepository() => new DictRepositorySQLite();
}
