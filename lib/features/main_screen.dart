import 'package:auto_route/annotations.dart';
import 'package:brothers_of_code/coreui/bottom_nav_bar/base_bottom_navigation_bar_item.dart';
import 'package:brothers_of_code/coreui/bottom_nav_bar/base_botton_navigation_bar.dart';
import 'package:brothers_of_code/features/comments/comments_screen.dart';
import 'package:brothers_of_code/features/gallery/presentation/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../core/enums/base_bottom_navigation_items.dart';
import '../coreui/base_app_bar.dart';
import '../coreui/base_cross_fade.dart';

@RoutePage(name: 'MainScreenRoute')
class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomItem = useState(BaseBottomNavigationItems.gallery);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: BaseAppBar(title: "Base scaffold",),
      ),
      body: BaseCrossFade<BaseBottomNavigationItems>(
        value: bottomItem.value,
        builder: (context, bItem) {
          switch (bItem) {
            case BaseBottomNavigationItems.gallery:
              {
                return const GalleryScreen();
              }
            case BaseBottomNavigationItems.comments:
              {
                return const CommentsScreen();
              }
          }
        },
      ),
      bottomNavigationBar: BaseBottomNavigationBar(
        items: [
          BaseBottomNavigationBarItem(icon: Icons.abc, text: 'Gallery'),
          //TODO easy localization
          BaseBottomNavigationBarItem(
              icon: Icons.ac_unit_outlined, text: 'Comments')
          //TODO easy localization
        ],
        onTap: (item) {
          bottomItem.value = BaseBottomNavigationItems.values[item];
        },
        currentIndex: bottomItem.value.index,
      ),
    );
  }
}
