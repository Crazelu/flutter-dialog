import 'dialog_request.dart';

abstract class DialogHandler {
  ///Dismisses a dialog
  void dismissDialog();

  /// Registers a callback to show a dialog
  void registerDialogListener(Function(DialogRequest) showDialogListener);

  ///Registers a callback to dismiss a dialog
  void registerDismissDialogListener(Function dismissCurrentDialog);

  ///Regsiters a callback to complete the Completer
  void dialogComplete(bool response);

  ///Displays a dialog on the screen
  Future<bool> showDialog({
    DialogType dialogType = DialogType.simple,
    String title = '',
    String message = '',
    bool autoDismiss = false,
    bool dismissable = true,
    Duration duration = const Duration(seconds: 3),
  });
}
