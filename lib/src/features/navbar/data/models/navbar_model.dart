import 'package:flutter/material.dart';

class NavbarModel {
  final String selectedIcon;
  final String unSelectedIcon;
  final Widget page;

  NavbarModel({
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.page,
  });
}
