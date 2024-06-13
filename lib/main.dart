import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config.dart';
import 'features/signUp/presentation/manager/sign_up_bloc.dart';
import 'firebase_options.dart';
import 'myApp.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(BlocProvider(
    create: (context) => getIt<SignUpBloc>(),
    child: const MyApp(),
  ));
}
