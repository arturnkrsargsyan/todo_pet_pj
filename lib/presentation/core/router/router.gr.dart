// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [TaskAddScreen]
class TaskAddRoute extends PageRouteInfo<void> {
  const TaskAddRoute({List<PageRouteInfo>? children})
      : super(
          TaskAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskAddRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TaskAddScreen();
    },
  );
}

/// generated route for
/// [ToDoScreen]
class ToDoRoute extends PageRouteInfo<ToDoRouteArgs> {
  ToDoRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ToDoRoute.name,
          args: ToDoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ToDoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<ToDoRouteArgs>(orElse: () => const ToDoRouteArgs());
      return ToDoScreen(key: args.key);
    },
  );
}

class ToDoRouteArgs {
  const ToDoRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ToDoRouteArgs{key: $key}';
  }
}
