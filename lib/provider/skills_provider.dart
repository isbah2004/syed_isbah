import 'package:flutter/material.dart';

class SkillsProvider extends ChangeNotifier {
  bool _dart = false;
  bool get dart => _dart;
  bool _flutter = false;
  bool get flutter => _flutter;
  void setDart(bool value) {
    _dart = value;
    notifyListeners();
  }

  void setFlutter(bool value) {
    _flutter = value;
    notifyListeners();
  }

  bool _python = false;
  bool get python => _python;

  void setPython(bool value) {
    _python = value;
    notifyListeners();
  }

  bool _mongoDB = false;

  bool get mongoDB => _mongoDB;

  void setMongoDB(bool value) {
    _mongoDB = value;
    notifyListeners();
  }

  bool _restAPI = false;

  bool get restAPI => _restAPI;

  void setRestAPI(bool value) {
    _restAPI = value;
    notifyListeners();
  }

  bool _fastAPI = false;

  bool get fastAPI => _fastAPI;

  void setFastAPI(bool value) {
    _fastAPI = value;
    notifyListeners();
  }

  bool _firebase = false;

  bool get firebase => _firebase;

  void setFirebase(bool value) {
    _firebase = value;
    notifyListeners();
  }
}
