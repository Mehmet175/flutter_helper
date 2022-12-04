import 'package:bionluk_otel/core/base/base_view_model.dart';
import 'package:bionluk_otel/core/helper/mixin/state_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  BaseView({super.key});

  void initState() {}
  void dispose() {}

  late final T viewModel;
  late final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BaseViewWrapper<T>(
      initState: initState,
      dispose: dispose,
      onBuilder: (context, viewModel) {
        this.viewModel = viewModel;
        this.context = context;
        return Consumer<T>(builder: (context, value, child) => onPageBuild());
      },
    );
  }

  Widget onPageBuild();
}

class BaseViewWrapper<T extends BaseViewModel> extends StatefulWidget {
  final VoidCallback? initState;
  final VoidCallback? dispose;
  final Widget Function(BuildContext context, T viewModel) onBuilder;

  const BaseViewWrapper(
      {super.key, required this.onBuilder, this.initState, this.dispose});

  @override
  State<BaseViewWrapper<T>> createState() => _BaseViewWrapperState<T>();
}

class _BaseViewWrapperState<T extends BaseViewModel>
    extends State<BaseViewWrapper<T>> with StateMixinWait {
  final _viewModel = GetIt.instance<T>();

  @override
  void initState() {
    super.initState();
    waitForScreen(() {
      _viewModel.onInit();
    });
    widget.initState?.call();
  }

  @override
  void dispose() {
    widget.dispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _viewModel,
      child: widget.onBuilder(context, _viewModel),
    );
  }
}
