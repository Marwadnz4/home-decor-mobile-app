import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/app_text_button.dart';
import 'package:home_decor/src/core/components/thin_text_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/extensions/navigation.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_assets.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/core/services/routing/routes.dart';
import 'package:home_decor/src/features/login/presentation/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(context.screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        context.l10n.loginTitle,
                        textScaler: TextScaler.linear(1.0),
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.melon,
                            ),
                      ),
                    ),

                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                    Text(
                      context.l10n.welcome,
                      textScaler: TextScaler.linear(1.0),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      context.l10n.welcomeSubTitle,
                      textScaler: TextScaler.linear(1.0),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                    LoginForm(),
                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                    Center(
                      child: SizedBox(
                        width: context.screenWidth * 0.4,
                        child: AppTextButton(
                          onPressed: () {
                            context.pushNamed(
                              Routes.navbarPage,
                            );
                          },
                          upperCase: false,
                          text: context.l10n.loginButton,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                    Center(
                      child: ThinTextButton(
                        onPressed: () {
                          context.pushNamed(Routes.forgetPasswordPage);
                        },
                        foregroundColor: AppColors.darkCharcoal,
                        child: Text(
                          context.l10n.forgetPasswordButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.screenHeight * 0.1),
                child: Column(
                  spacing: context.screenHeight * 0.02,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.orMethod,
                      textScaler: TextScaler.linear(1.0),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      spacing: context.screenWidth * 0.1,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.facebookIcon,
                        ),
                        Image.asset(
                          AppAssets.googleIcon,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.haveNoAccount,
                          textScaler: TextScaler.linear(1.0),
                        ),
                        ThinTextButton(
                          onPressed: () {
                            context.pushNamed(
                              Routes.signupPage,
                            );
                          },
                          foregroundColor: AppColors.fuzzyWuzzy,
                          child: Text(
                            context.l10n.signUp,
                            textScaler: TextScaler.linear(1.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
