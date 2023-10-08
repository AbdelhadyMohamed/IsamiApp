import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";
  String mode = "light";

  changeLanguage(String languageCode) {
    local = languageCode;
    notifyListeners();
  }

  changeMode(String modeCode) {
    local = modeCode;
    notifyListeners();
  }
}
