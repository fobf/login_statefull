import 'package:flutter/material.dart';
import 'package:login_statefull/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            SizedBox(height: 20),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'mail@example.com',
      ),
      validator: validateEmail,
      onSaved: (value) {
        if (value != null) {
          email = value;
        }
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Your Password',
      ),
      validator: validatePassword,
      onSaved: (value) {
        if (value != null) {
          password = value;
        }
      },
    );
  }

  Widget submitButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          elevation: MaterialStateProperty.all(10),
        ),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState!.save();
            print('Time to post $email and $password to  my API');
          }
        },
        child: Text('Submit'),
      ),
    );
  }
}
