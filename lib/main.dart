import 'package:flutter/material.dart';

void main() => runApp(MyFormApp());

class MyFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Form'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode;

  var emailController = TextEditingController();
  var pwController = TextEditingController();

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
    emailController.addListener(_emailChanged);
    pwController.addListener(_pwChanged);
  }

  _emailChanged() {
    print("email value changed: ${emailController.text}");
  }

  _pwChanged() {
    print("password value changed: ${pwController.text}");
  }

  @override
  void dispose() {
    focusNode.dispose();
    emailController.dispose();
    pwController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter anything.';
              }
            },
            decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'xxx@email.com',
                labelText: 'email'),
            autofocus: true,
          ),
          TextFormField(
            controller: pwController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter anything here too.';
              }
            },
            decoration: InputDecoration(
                icon: Icon(Icons.security),
                hintText: 'password',
                labelText: 'password'),
            obscureText: true,
            focusNode: focusNode,
          ),
          RaisedButton(
            child: Text('Button'),
            onPressed: () {
              if (focusNode.hasFocus) {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Wow form done!!!'),
                  ));
                }
              } else {
                FocusScope.of(context).requestFocus(focusNode);
              }

              print("email value: ${emailController.text}");
            },
          )
        ],
      ),
    );
  }
}
