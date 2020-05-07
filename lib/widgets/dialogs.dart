import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final contentText;

  SuccessDialog({this.contentText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Congratulations!'),
      content: Text(contentText),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}

class FailureDialog extends StatelessWidget {
  final contentText;

  FailureDialog({this.contentText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Something Went Wrong!'),
      content: Text(contentText + '. Please Try Again'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}

class ConfimationDialog extends StatelessWidget {
  final contentText;

  ConfimationDialog({this.contentText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are You Sure?'),
      content:
          Text(this.contentText),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop<bool>(context, false);
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop<bool>(context, true);
          },
          child: Text('Accept'),
        ),
      ],
    );
  }
}
