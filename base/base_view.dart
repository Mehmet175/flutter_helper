import 'package:bionluk_otel/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  BaseView({super.key});
  void onInit() {}

  final viewModel = GetIt.instance<T>();

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: (){
        onInit();
        viewModel.onInit();
      },
      child: ChangeNotifierProvider(
        create: (context) {
          return viewModel;
        },
        child: onPageBuild(),
      ),
    );
  }

  Widget onPageBuild();
}


class StatefulWrapper extends StatefulWidget {
  final Function() onInit;
  final Widget child;

  const StatefulWrapper({required this.onInit, required this.child});

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
