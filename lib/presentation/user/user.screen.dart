import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/theme/contant.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'controllers/user.controller.dart';

class UserScreen extends GetView<UserController> {
  UserScreen({Key? key}) : super(key: key);

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String? _validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return "Wajib diisi.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          backgroundColor: primaryColor,
          foregroundColor: whiteBackground,
        ),
        body: Center(
          child: createUserLayout(),
        ));
  }

  Widget createUserLayout() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 24.0,
          ),
          TextFormField(
            controller: controller.namaTextController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person),
                hintText: "Your name?",
                labelText: "Name *"),
            validator: _validateName,
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextFormField(
            controller: controller.usernameTextController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person_pin_sharp),
                hintText: "Your id or unique name?",
                labelText: "Username *"),
            validator: _validateName,
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextFormField(
            controller: controller.emailTextController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.email),
                hintText: "Your email address?",
                labelText: "E-mail *"),
            validator: _validateName,
          ),
          const SizedBox(
            height: 24.0,
          ),
          PasswordField(
            fieldKey: _passwordFieldKey,
            helperText: "No more than 8 characters.",
            labelText: "Password *",
            controller: controller.passwordTextController,
          ),
          const SizedBox(
            height: 24.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 45.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.blueAccent,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onPressed: () {},
                child: const Text("Simpan")),
          )
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController? controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      controller: widget.controller,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        icon: const Icon(Icons.security),
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
