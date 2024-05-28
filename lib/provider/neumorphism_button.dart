import 'package:flutter/material.dart';
class NeumorphismProvider extends ChangeNotifier {
  bool _isHomePressed = false;
  bool _isContactPressed = false;
  bool _isSkillsPressed = false;
  bool _isAboutPressed = false;
  bool _isProjectsPressed = false;

  bool get isHomePressed => _isHomePressed;
  bool get isContactPressed => _isContactPressed;
  bool get isSkillsPressed => _isSkillsPressed;
  bool get isAboutPressed => _isAboutPressed;
  bool get isProjectsPressed => _isProjectsPressed;

  void setHomePressed(bool value) {
    _isHomePressed = value;
    notifyListeners();
  }

  void setContactPressed(bool value) {
    _isContactPressed = value;
    notifyListeners();
  }

  void setSkillsPressed(bool value) {
    _isSkillsPressed = value;
    notifyListeners();
  }

  void setAboutPressed(bool value) {
    _isAboutPressed = value;
    notifyListeners();
  }
  void setProjectsPressed(bool value) {
    _isProjectsPressed = value;
    notifyListeners();
  }
}
class ResumeProvider extends ChangeNotifier {
  bool _isPressed = false;
 

  bool get isPressed => _isPressed;
 

  void setPressed(bool value) {
    _isPressed = value;
    notifyListeners();
  }

}