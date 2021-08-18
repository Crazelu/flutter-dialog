import 'package:flutter/material.dart';
import '../dialog/dialog_request.dart';

class FloatingDialogCard extends StatelessWidget {
  final DialogRequest request;
  final VoidCallback dismissDialog;

  const FloatingDialogCard({
    Key? key,
    required this.request,
    required this.dismissDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Successful",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: dismissDialog,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  request.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
