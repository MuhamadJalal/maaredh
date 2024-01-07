import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maaredh/app.dart';
import 'package:maaredh/core/bloc/app_bloc_observer.dart';
import 'package:maaredh/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  await injectorSetup();

  runApp(const MaaredhApp());
}
