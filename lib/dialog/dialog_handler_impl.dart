import 'dart:async';
import 'dialog_handler.dart';
import 'dialog_request.dart';

class DialogHandlerImpl implements DialogHandler {
  late Function(DialogRequest) _showDialogListener;
  late Completer<bool> _dialogCompleter;
  late Function _dismissCurrentDialog;

  bool _isDialogVisible = false;

  Completer<bool> get dialogCompleter => _dialogCompleter;

  @override
  void dialogComplete(bool response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = Completer<bool>();
  }

  @override
  void dismissDialog() {
    _dismissCurrentDialog();
  }

  @override
  void registerDialogListener(
      Function(DialogRequest request) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  @override
  void registerDismissDialogListener(Function dismissCurrentDialog) {
    _dismissCurrentDialog = dismissCurrentDialog;
  }

  ///Dismisses any visible dialog
  void _closeVisibleDialog() {
    if (_isDialogVisible) {
      dismissDialog();
    }
  }

  @override
  Future<bool> showDialog({
    DialogType dialogType = DialogType.simple,
    String title = '',
    String message = '',
    bool autoDismiss = false,
    bool dismissable = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    _dialogCompleter = Completer<bool>();

    //close any visible dialog before showing a new one
    _closeVisibleDialog();

    _showDialogListener(
      DialogRequest(
        title: title,
        message: message,
        dialogType: dialogType,
        duration: duration,
        autoDismiss: autoDismiss,
        dismissable: dismissable,
      ),
    );

    _isDialogVisible = true;
    return _dialogCompleter.future;
  }
}
