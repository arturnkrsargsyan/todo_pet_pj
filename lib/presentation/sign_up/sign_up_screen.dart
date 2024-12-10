import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/auth/auth_block.dart';
import 'package:todo_app/app/auth/auth_event.dart';
import 'package:todo_app/app/auth/auth_state.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/presentation/core/consts/typography.dart';
import 'package:todo_app/presentation/core/router/router.dart';
import 'package:todo_app/presentation/home/widget/button.dart';
import 'package:todo_app/presentation/login/widget/customPainter.dart';
import 'package:todo_app/presentation/login/widget/textfild_style.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Custompainter(
              appText: 'Signup',
            ),
            const SizedBox(height: 30),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextfildStyle(
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
                    child: TextfildStyle(
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
                    child: TextfildStyle(
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
              ),
            ),
            const SizedBox(height: 30),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateSuccessful) {
                  context.router.push(const LoginRoute());
                }
              },
              builder: (context, state) {
                if (state is AuthStateInProgress) {
                  return const CircularProgressIndicator();
                }
                return Button(
                  bottonText: 'Sign up',
                  buttonFunction: () {
                    if (formKey.currentState!.validate()) {}
                    context.read<AuthBloc>().add(
                          SignUpWhitEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                          ),
                        );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Our sign up whit',
              style: AppTypography.s16w5h19_b,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.images.google.path,
                  width: 50,
                ),
                const SizedBox(width: 30),
                Image.asset(
                  Assets.images.facebook.path,
                  width: 50,
                ),
                const SizedBox(width: 30),
                Image.asset(
                  Assets.images.instagam.path,
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
