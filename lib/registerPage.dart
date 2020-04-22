import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Sex { male, female }

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Sex _sex = Sex.male;
  DateTime _selectedDate;
  final _formKey = GlobalKey<FormState>();
  final _dob = TextEditingController();
  final _pass = TextEditingController();

  void registerAction(BuildContext context) {
    print('Register button pressed');
  }

  @override
  void dispose() {
    _dob.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hasFloatingPlaceholder: true,
                        ),
                        validator: (value) {
                          if(value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Gender:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Radio(
                            value: Sex.male,
                            groupValue: _sex,
                            onChanged: (Sex value) {
                              setState(() {
                                _sex = value;
                              });
                            },
                          ),
                          Text('Male'),
                          Radio(
                            value: Sex.female,
                            groupValue: _sex,
                            onChanged: (Sex value) {
                              setState(() {
                                _sex = value;
                              });
                            },
                          ),
                          Text('Female'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mobile No.',
                          hasFloatingPlaceholder: true,
                        ),
                        validator: (value) {
                          if(value.isEmpty) {
                            return "Please enter your Mobile Number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _dob,
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          hasFloatingPlaceholder: true,
                          suffixIcon: Icon(Icons.date_range),
                        ),
                        validator: (value) {
                          if(value.isEmpty) {
                            return "Please enter your Date of Birth";
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now().subtract(
                                Duration(
                                  days: 36500,
                                ),
                              ),
                              initialDate: _selectedDate == null
                                  ? DateTime.now()
                                  : _selectedDate,
                              initialDatePickerMode: DatePickerMode.year,
                              lastDate: DateTime.now());
                          if (selectedDate != null) {
                            _selectedDate = selectedDate;
                            setState(() => _dob.text =
                                DateFormat.yMMMMd('en_US')
                                    .format(_selectedDate));
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hasFloatingPlaceholder: true,
                        ),
                        validator: (value) {
                          if(value.isEmpty) {
                            return "Please provide a password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hasFloatingPlaceholder: true,
                        ),
                        validator: (value) {
                          if(value != _pass.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          onPressed: () {
                            if(_formKey.currentState.validate()) {
                              registerAction(context);
                            }
                          },
                          child: Text('Register'),
                        ),
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.only(left: 25, right: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
