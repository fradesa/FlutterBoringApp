import 'package:flutter/material.dart';
import 'package:boring_form/boring_form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:boring_app/boring_app.dart';

import '../services/loginAuth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final BoringFormController formController = BoringFormController();
  final _rad = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 600,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark.withAlpha(20),
                      borderRadius: BorderRadius.circular(_rad)),
                  child: Column(
                    children: [
                      BoringForm(
                        title: "Login",
                        style: BoringFormStyle(
                          formTitleStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          inputDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(_rad),
                            ),
                          ),
                        ),
                        formController: formController,
                        fields: [
                          BoringEmailField(
                            decoration: BoringFieldDecoration(label: "Email"),
                            jsonKey: 'email',
                            invalidEmailMessage: 'Please enter a valid email',
                          ),
                          BoringPasswordField(
                            fieldController: BoringFieldController(
                              validationFunction: (value) {
                                if (value == null)
                                  return "Please enter a password";
                                if (value.isEmpty) {
                                  return "Please enter a password";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                BoringFieldDecoration(label: "Password"),
                            jsonKey: 'pwd',
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formController.isValid) {
                            LoginAuth.setUserLogStatus(true);
                            context.go("/");
                          }
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
