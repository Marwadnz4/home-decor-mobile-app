import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/app_text_button.dart';
import 'package:home_decor/src/core/components/thin_text_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/extensions/navigation.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_assets.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/core/services/routing/routes.dart';
import 'package:home_decor/src/features/signup/presentation/widgets/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          context.l10n.createAccount,
                          textScaler: TextScaler.linear(1.0),
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.melon,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                SignupForm(),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                Center(
                  child: SizedBox(
                    width: context.screenWidth * 0.4,
                    child: RichText(
                      textScaler: TextScaler.linear(1.0),
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: context.l10n.licences,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: context.l10n.termsOfUse,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: context.l10n.and,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: context.l10n.privacyPolicy,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                      text: context.l10n.signUp,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.screenHeight * 0.05,
                    ),
                    child: Text(
                      context.l10n.orMethod,
                      textScaler: TextScaler.linear(1.0),
                    ),
                  ),
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
                      context.l10n.haveAccount,
                      textScaler: TextScaler.linear(1.0),
                    ),
                    ThinTextButton(
                      onPressed: () {
                        context.pushNamed(
                          Routes.loginPage,
                        );
                      },
                      foregroundColor: AppColors.fuzzyWuzzy,
                      child: Text(
                        context.l10n.loginTitle,
                        textScaler: TextScaler.linear(1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
