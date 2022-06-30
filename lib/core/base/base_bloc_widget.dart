import 'package:carsomeweathertest/core/blocs/master_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/base_bloc/base_state.dart';
import '../ui/widgets/loading_dialog.dart';
import 'base_screen.dart';

abstract class BaseBlocWidget extends BaseScreen {
  const BaseBlocWidget({Key? key}) : super(key: key);
}

abstract class BaseBlocWidgetState<T extends BaseBlocWidget>
    extends BaseScreenState<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool isDialogShowing = false;

  @override
  Widget body(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<MasterBloc, BaseApiState>(
            listenWhen: (prevState, curState) {
              return prevState != curState;
            },
            listener: (context, state) {
              if (state is ApiErrorState && isDialogShowing) {
                hideDialog();
              } else if (state is ApiLoadingState) {
                if (!isDialogShowing && ModalRoute.of(context)!.isCurrent) {
                  showDialogView();
                }
              } else if (state is ApiLoadedState && isDialogShowing) {
                hideDialog();
              }
            },
          ),
        ],
        child: getCustomBloc(),
      );

  void showError(
      {required String? errorContent,
      String? title,
      bool shouldLocalize = true,
      Function? onPressed,
      dynamic buttonColor}) {
    showToast("message");
  }

  void showErrorDialog(String errorMessage) => showToast(errorMessage);

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  Widget getCustomBloc();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> showDialogView() async {
    if (isDialogShowing) {
      return;
    }
    isDialogShowing = true;
    await loadingDialog(
      context: context,
    );
  }

  hideDialog() {
    if (isDialogShowing) {
      isDialogShowing = false;
    }
    Navigator.pop(context);
  }
}
