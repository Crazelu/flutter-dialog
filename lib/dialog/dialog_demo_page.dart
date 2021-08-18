import 'package:flutter/material.dart';
import '../dialog/dialog_request.dart';
import '../dialog/dialog_handler.dart';
import '../dialog/locator.dart';

class DialogDemoPage extends StatelessWidget {
  const DialogDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Demo"),
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.blueAccent,
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white,
                ),
              ),
              onPressed: () {
                locator<DialogHandler>().showDialog(
                  title: "Hey champ",
                  message: "Here's a demo of the centered simple dialog",
                );
              },
              child: Text("Show simple dialog"),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.blueAccent,
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white,
                ),
              ),
              onPressed: () {
                locator<DialogHandler>().showDialog(
                  dialogType: DialogType.floating,
                  title: "Hey champ",
                  message: "Here's a demo of the floating dialog",
                );
              },
              child: Text("Show floating dialog"),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.blueAccent,
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white,
                ),
              ),
              onPressed: () {
                locator<DialogHandler>().showDialog(
                  autoDismiss: true,
                  title: "Hey champ",
                  message: "I will self destruct in 3 seconds",
                );
              },
              child: Text("Show dialog with auto dismissal"),
            ),
          ],
        ),
      ),
    );
  }
}
