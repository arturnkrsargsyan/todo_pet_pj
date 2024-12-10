import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/auth/auth_block.dart';
import 'package:todo_app/app/auth/auth_event.dart';
import 'package:todo_app/app/auth/auth_state.dart';
import 'package:todo_app/presentation/core/consts/typography.dart';
import 'package:todo_app/presentation/core/router/router.dart';
import 'package:todo_app/presentation/home/widget/button.dart';
import 'package:todo_app/presentation/login/widget/customPainter.dart';
import 'package:todo_app/presentation/login/widget/textfild_style.dart';
import 'package:todo_app/presentation/sign_up/sign_up_screen.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool change = true;

  void changeFunction() {
    setState(() {
      change = !change;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateSuccessful) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const SizedBox();
            },
          ));
        }
      },
      child: Scaffold(
        body: change
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const Custompainter(
                      appText: 'Login',
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
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              labelText: 'Email',
                              prefixIconAdd: const Icon(Icons.person_outline),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: TextfildStyle(
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
                              prefixIconAdd:
                                  const Icon(Icons.password_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 160),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthStateInProgress) {
                          return const CircularProgressIndicator();
                        }
                        return Button(
                          bottonText: 'Log in',
                          buttonFunction: () {
                            if (formKey.currentState!.validate()) {}
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              return;
                            }
                            if (state is AuthStateSuccessful) {
                              context.router.push(const LoginRoute());
                            }
                            context.read<AuthBloc>().add(
                                  LoginWithEmailAndPassword(
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
                      'Dont Have A Acount?',
                      style: AppTypography.s14w4h20,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        changeFunction();
                      },
                      child: const Text(
                        'Sign Up!',
                        style: AppTypography.s16w5h19_b,
                      ),
                    ),
                  ],
                ),
              )
            : const SignUpScreen(),
      ),
    );
  }
}
