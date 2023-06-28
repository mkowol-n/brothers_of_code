import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DialogModalRoute<T> extends CustomRoute {
  DialogModalRoute({required PageInfo<T> page, String? path})
      : super(
    page: page,
    path: path,
    customRouteBuilder: dialogRouteBuilder,
  );

  static Route<T> dialogRouteBuilder<T>(
      BuildContext context,
      Widget child,
      AutoRoutePage<T> page,
      ) =>
      DialogRoute<T>(
        context: context,
        settings: page,
        builder: (context) => child,
      );
}