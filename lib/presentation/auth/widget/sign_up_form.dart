import 'package:flutter/material.dart';
import 'package:todo_app/presentation/auth/widget/text_field_style.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldStyle(
            textFildController: emailController,
            fildValidator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            labelText: 'Password',
            prefixIconAdd: const Icon(Icons.password_outlined),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldStyle(
            textFildController: confirmPasswordController,
            fildValidator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            labelText: 'Confirm Password',
            prefixIconAdd: const Icon(Icons.password_outlined),
          ),
        ),
      ],
    );
  }
}
