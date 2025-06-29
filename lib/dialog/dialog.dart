
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static showLoadingDialog(BuildContext context, String? loadingMessage) {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
              content: Row(
            children: [
              Text(loadingMessage ?? ''),
              Spacer(),
              const CircularProgressIndicator(),
            ],
          ));
        });
  }

  static hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessageDialog(BuildContext context,
      {required String message,
      String? posTitle,
      String? negTitle,
      VoidCallback? posAction,
      VoidCallback? negAction}) {
    List<Widget> actions = [];
    if (posTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            posAction?.call();
                        hideDialog(context);

          },
          child: Text(posTitle)));
    } else if (negTitle != null) {
      actions.add(TextButton(
          onPressed: () {
           
            negAction?.call();
             hideDialog(context);
          },
          child: Text(negTitle)));
    }
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            actions: actions,
            content: Column(
              children: [Text(message)],
            ),
          );
        });
  }
}
