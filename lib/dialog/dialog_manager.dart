import 'package:flutter/material.dart';
import 'dialog_handler.dart';
import 'dialog_request.dart';
import 'floating_dialog_card.dart';
import 'locator.dart';
import 'simple_dialog_card.dart';

///A Widget wrapper around all the views in your widget tree.
///
///Typically, when a route is pushed onto the navigation stack,
///the widget contained in that route is wrapped with a [DialogManager] widget
///so dialogs can be overlayed on top.
class DialogManager extends StatefulWidget {
  const DialogManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  ///The parent widget passed down from every route navigation
  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  OverlayEntry? _overlayEntry;
  late DialogHandler _dialogHandler;

  @override
  void initState() {
    super.initState();
    _dialogHandler = locator<DialogHandler>();
    _dialogHandler.registerDialogListener(_showDialog);
    _dialogHandler.registerDismissDialogListener(_dismissDialog);
  }

  ///Pops a dialog onto the screen
  void _showDialog(DialogRequest request) {
    _overlayEntry = _createOverlayEntry(request);

    Overlay.of(context)!.insert(_overlayEntry!);

    //dismiss dialog after [request.duration] if [request.autoDismiss] is true
    if (request.autoDismiss) {
      Future.delayed(request.duration).then(
        (value) => _dismissDialog(),
      );
    }
  }

  ///Dismisses a dialog and completes the associated Completer
  void _dismissDialog([bool status = false]) {
    if (_overlayEntry != null) {
      _dialogHandler.dialogComplete(status);
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  ///Creates and OverlayEntry which contains the dialog card
  OverlayEntry _createOverlayEntry(DialogRequest request) {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width,
        child: getDialogCard(request),
      ),
    );
  }

  Widget getDialogCard(DialogRequest request) {
    switch (request.dialogType) {
      case DialogType.floating:
        return FloatingDialogCard(
          request: request,
          dismissDialog: _dismissDialog,
        );
      default:
        return SimpleDialogCard(
          request: request,
          dismissDialog: _dismissDialog,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
