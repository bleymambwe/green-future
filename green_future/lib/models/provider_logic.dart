import 'package:flutter/material.dart';
import 'appstate_model.dart';

class AppStateProvider extends ChangeNotifier {
  AppState _appState = AppState('Initial Data');

  AppState get appState => _appState;

  void updateData(String newData) {
    _appState = AppState(newData);
    notifyListeners();
  }
}
