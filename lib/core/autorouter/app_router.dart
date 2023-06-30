import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/gallery/domain/model/gallery_model.dart';
import '../../features/gallery/presentation/widgets/single_image_dialog.dart';
import '../../features/main_screen.dart';
import 'dialog_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainScreenRoute.page,
      path: '/MainScreen',
      initial: true
    ),
    DialogModalRoute(
      page: SingleImageDialogRoute.page,
      path: '/SingleImageDialog'
    ),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
}