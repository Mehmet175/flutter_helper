import 'package:bionluk_otel/core/base/base_view.dart';
import 'package:flutter/material.dart';

mixin StateMixinWait<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}

mixin StateMixinWaitBase<T extends BaseView> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
