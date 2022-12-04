import 'package:bionluk_otel/core/helper/enum/state_enum.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel with ChangeNotifier {



  StateEnum _stateEnum = StateEnum.loading;
  String? errorString;

  StateEnum get stateEnum => _stateEnum;
  set stateEnum(StateEnum value) {
    _stateEnum = value;
    notifyListeners();
  }

  void stateLoading(){
    stateEnum = StateEnum.loading;
  }

  void stateOk() {
    stateEnum = StateEnum.ok;
  }
  void stateError(String errorMessage) {
    errorString = errorMessage;
    stateEnum = StateEnum.error;
  }


  Future<void> onInit() async{}


}
