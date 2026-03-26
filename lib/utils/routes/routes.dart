import 'package:flutter/material.dart';
import 'package:ipl_app_flutter26/UI/dashboard/DashboardPage.dart';
import 'package:ipl_app_flutter26/UI/user_view/LoginScreen.dart';
import 'package:ipl_app_flutter26/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.dashboard:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DashboardPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No Route defined')),
            );
          },
        );
    }
  }
}
