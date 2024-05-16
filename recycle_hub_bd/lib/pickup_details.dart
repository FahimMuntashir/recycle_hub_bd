import 'package:flutter/material.dart';

class PickupDetails extends StatefulWidget {
  // PickupDetails({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  _PickupDetailsState createState() => _PickupDetailsState();
}

class _PickupDetailsState extends State<PickupDetails> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _phoneNumber;
  String? _address;
  String? _email;
  DateTime? _date;
  String? _remark;
  bool? _autoValidate;

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you can send the form data to your server
      print(
          'Form Submitted: $_name, $_phoneNumber, $_address, $_email, $_date, $_remark');
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pickup Details"),
      ),
      body: Form(
        key: _formKey,
        // autovalidateMode: _autoValidate,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _phoneNumber = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Address cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _address = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }
                  String pattern =
                      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Enter Valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (String? value) {
                  _email = value;
                },
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Date'),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  );
                  if (picked != null && picked != _date) {
                    setState(() {
                      _date = picked;
                    });
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Remark'),
                maxLines: 5,
                onSaved: (value) => _remark = value,
              ),
              ElevatedButton(
                onPressed: _validateInputs,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
