import 'package:auto_route/auto_route.dart';
import 'package:todo_app/presentation/home/home_screen.dart';
import 'package:todo_app/presentation/login/login_screen.dart';
import 'package:todo_app/presentation/sign_up/sign_up_screen.dart';
import 'package:todo_app/presentation/to_do_page/to_do_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/signup',
          page: SignUpRoute.page,
        ),
        AutoRoute(
          path: '/to_do',
          page: ToDoRoute.page,
        ),
      ];
}