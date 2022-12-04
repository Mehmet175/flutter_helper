import 'package:bionluk_otel/app/page/splash/view_model/splash_view_model.dart';
import 'package:bionluk_otel/core/base/base_view.dart';
import 'package:bionluk_otel/core/base/base_view_model.dart';
import 'package:flutter/material.dart';

mixin PageRouter<T extends BaseViewModel> on BaseView<T> {
  // Yeni sayfaya gider.
  void to(BaseView page) {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => page));
  }

  // Geri sayfaya gider.
  void back() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  // Yeni sayfaya gider ve back stack'den bulunulan sayfayı siler.
  void off(BaseView page) {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );

    // Yeni sayfaya gider ve backstack'i temizler
    void offAll(BaseView page) {
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => page,
          ),
          (Route<dynamic> route) => false);
    }
  }
}
