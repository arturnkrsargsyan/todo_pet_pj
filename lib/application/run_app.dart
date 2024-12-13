import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/application/app.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/di.dart';

Future<void> runAndInitialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const Todo());
}
