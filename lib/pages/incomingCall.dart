import 'package:flutter/material.dart';

import '../models/doctor.dart';

class IncomingCall extends StatelessWidget {
  static String routeName = '/incomingCall';

  void _acceptCall() {

  }

  void _rejectCall() {

  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // Doctor doctor = ModalRoute.of(context).settings.arguments;
    Doctor doctor = Doctor(name: 'Dr.Shafiul Islam');
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: CircleAvatar(
                minRadius: 100,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              doctor.name,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor),
            ),
            Text('is calling',
                style: TextStyle(fontSize: 20, color: theme.primaryColor)),
            Expanded(
              child: SizedBox(),
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.all(50),
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.primaryColor,
                  ),
                  child: FittedBox(
                    child: IconButton(
                      icon: Icon(Icons.call, color: Colors.white,),
                      onPressed: _acceptCall,
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.primaryColor,
                  ),
                  child: FittedBox(
                    child: IconButton(
                      icon: Icon(Icons.clear, color: Colors.white),
                      onPressed: _rejectCall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
