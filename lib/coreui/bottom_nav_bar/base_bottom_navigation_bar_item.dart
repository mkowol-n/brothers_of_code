import 'package:flutter/cupertino.dart';

class BaseBottomNavigationBarItem extends BottomNavigationBarItem {
  BaseBottomNavigationBarItem({required IconData icon, required String text}): super(icon: Icon(icon), label: text);
}