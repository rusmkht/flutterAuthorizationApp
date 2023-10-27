import 'package:authorization/feature/auth/presentation/screens/login_screen.dart';
import 'package:authorization/feature/profile/presentation/screens/profile_sceen.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page)
      ];
}
