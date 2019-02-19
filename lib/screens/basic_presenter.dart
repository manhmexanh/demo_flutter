import 'package:flutter/material.dart';
abstract class BasicPresenter {
  Future loadData() async {}
  void refreshData() {}
}