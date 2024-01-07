import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maaredh/di/injector.dart' as di;
import 'package:maaredh/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:maaredh/features/auth/presentation/screens/home_screen.dart';

class Routes {
  static const initialRoute = '/';
  static const homeScreenRoute = '/homeScreen';
}

// final routes = {
//   Routes.initialRoute: (context) => const MyHomeScreen(),
// };

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => BlocProvider<AuthBloc>(create: (context) => di.getIt<AuthBloc>(), child: const HomeScreen())));
      default:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));
    }
  }
}
