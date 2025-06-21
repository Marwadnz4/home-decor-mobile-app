import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/features/navbar/presentation/manager/cubit/navbar_cubit.dart';

class NavbarIcon extends StatelessWidget {
  final String icon;
  final String unSelectedIcon;
  final int index;
  final NavbarCubit cubit;

  const NavbarIcon({
    super.key,
    required this.icon,
    required this.unSelectedIcon,
    required this.index,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: context.screenHeight * 0.05,
    );
  }
}
