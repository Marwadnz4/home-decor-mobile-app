import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/features/navbar/data/models/navbar_model.dart';
import 'package:home_decor/src/features/navbar/presentation/manager/cubit/navbar_cubit.dart';
import 'package:home_decor/src/features/navbar/presentation/manager/cubit/navbar_state.dart';
import 'package:home_decor/src/features/navbar/presentation/widgets/navbar_icon.dart';

class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        NavbarCubit cubit = context.read<NavbarCubit>();

        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: cubit.pages[cubit.bottomNavIndex].page,
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        cubit.pages.length,
                        (index) {
                          NavbarModel page = cubit.pages[index];
                          return NavbarIcon(
                            icon: cubit.bottomNavIndex == index
                                ? page.selectedIcon
                                : page.unSelectedIcon,
                            unSelectedIcon: page.unSelectedIcon,
                            index: index,
                            cubit: cubit,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
