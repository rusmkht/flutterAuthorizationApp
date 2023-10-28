import 'package:authorization/app/app_theme.dart';
import 'package:authorization/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:authorization/feature/auth/presentation/screens/login_screen.dart';
import 'package:authorization/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationApp extends StatefulWidget {
  const AuthorizationApp({super.key});

  @override
  State<AuthorizationApp> createState() => _AuthorizationAppState();
}

class _AuthorizationAppState extends State<AuthorizationApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: CupertinoApp.router(
        theme: appTheme,
        title: 'Authorization App',
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
