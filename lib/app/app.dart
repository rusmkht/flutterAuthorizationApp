import 'package:authorization/feature/auth/presentation/screens/login_screen.dart';
import 'package:authorization/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthorizationApp extends StatefulWidget {
  const AuthorizationApp({super.key});

  @override
  State<AuthorizationApp> createState() => _AuthorizationAppState();
}

class _AuthorizationAppState extends State<AuthorizationApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Authorization App',
      routerConfig: _appRouter.config(),
    );
  }
}
