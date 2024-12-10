import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/auth/auth_block.dart';
import 'package:todo_app/application/auth/auth_event.dart';
import 'package:todo_app/application/auth/auth_state.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/presentation/auth/widget/customPainter.dart';
import 'package:todo_app/presentation/auth/widget/login_form.dart';
import 'package:todo_app/presentation/auth/widget/sign_up_form.dart';
import 'package:todo_app/presentation/core/consts/typography.dart';
import 'package:todo_app/presentation/core/router/router.dart';
import 'package:todo_app/presentation/home/widget/button.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
          body: SingleChildScrollView(
        child: Column(
          children: [
            Custompainter(appText: change ? 'Login' : 'Sign Up'),
            const SizedBox(height: 30),
            Form(
                key: formKey,
                child: change ? const LoginForm() : const SignUpForm()),
            SizedBox(height: change ? 150 : 70),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateSuccessful) {
                  context.router.push(const ToDoRoute());
                }
              },
              builder: (context, state) {
                if (state is AuthStateInProgress) {
                  return const CircularProgressIndicator();
                }
                return Button(
                  buttonText: change ? 'Log in' : 'Sign Up',
                  buttonFunction: () {
                    if (formKey.currentState!.validate()) {}
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      return;
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
            Text(
              change ? 'Dont Have A Account?' : '',
              style: AppTypography.s14w4h20,
            ),
            change
                ? const SizedBox()
                : Row(
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
                        Assets.images.instagram.path,
                        width: 50,
                      ),
                    ],
                  ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                changeFunction();
              },
              child: Text(
                change ? 'Sign Up!' : 'Our sign up whit',
                style: AppTypography.s16w5h19_b,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
