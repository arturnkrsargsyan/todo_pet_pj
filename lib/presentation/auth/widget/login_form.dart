import 'package:flutter/material.dart';
import 'package:todo_app/presentation/auth/widget/text_field_style.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldStyle(
            textFildController: emailController,
            fildValidator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            labelText: 'Email',
            prefixIconAdd: const Icon(Icons.person_outline),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldStyle(
            textFildController: passwordController,
            fildValidator: (value) {
              if (value!.isEmpty) {
                return "* Required";
              } else if (value.length < 6) {
                return "Password should be atleast 6 characters";
              } else if (value.length > 15) {
                return "Password should not be greater than 15 characters";
              } else
                return null;
            },
            labelText: 'Password',
            prefixIconAdd: const Icon(Icons.password_outlined),
          ),
        ),
      ],
    );
  }
}
