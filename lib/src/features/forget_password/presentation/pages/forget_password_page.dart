import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/app_text_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/extensions/navigation.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/core/services/routing/routes.dart';
import 'package:home_decor/src/features/forget_password/presentation/widgets/forget_password_form.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: context.size!.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.size!.width * 0.05,
                ),
                child: Row(
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
                          context.l10n.forgetPassword,
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
              ),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.size!.width * 0.05,
                ),
                child: Text(
                  context.l10n.resetPassword,
                  textScaler: TextScaler.linear(1.0),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: context.size!.width * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: context.size!.height * 0.05,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.melon.withAlpha(70),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.size!.width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.size!.height * 0.05,
                        ),
                        ForgetPasswordForm(),
                        Center(
                          child: SizedBox(
                            width: context.size!.width * 0.4,
                            child: AppTextButton(
                              upperCase: false,
                              onPressed: () {
                                context.pushNamed(Routes.setPasswordPage);
                              },
                              text: context.l10n.next,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
