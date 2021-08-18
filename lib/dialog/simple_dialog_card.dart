import 'package:flutter/material.dart';
import '../dialog/dialog_request.dart';

GlobalKey dialogContainerKey = GlobalKey();
const dialogMargin = 20.0;

class SimpleDialogCard extends StatelessWidget {
  final DialogRequest request;
  final VoidCallback dismissDialog;

  const SimpleDialogCard({
    Key? key,
    required this.request,
    required this.dismissDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTapDown: (details) {
        //do nothing if dialog is not dismissable
        if (!request.dismissable) return;

        var screenOffset = details.localPosition;
        var dialogCardHeight = dialogContainerKey.currentContext!.size!.height;

        //dismiss dialog if user taps on any screen area
        //outside the dimensions of the dialog

        if (screenOffset.dy < (height - dialogCardHeight) / 2 ||
            screenOffset.dy > (height + dialogCardHeight) / 2) {
          dismissDialog();
        }
        if (screenOffset.dx < dialogMargin ||
            screenOffset.dx > (width - dialogMargin)) {
          dismissDialog();
        }
      },
      child: Material(
        color: Colors.black.withOpacity(.8),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                key: dialogContainerKey,
                margin: const EdgeInsets.symmetric(horizontal: dialogMargin),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        request.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            request.message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Colors.blueAccent,
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Colors.white,
                                  ),
                                ),
                                onPressed: dismissDialog,
                                child: Text('Got it'),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
