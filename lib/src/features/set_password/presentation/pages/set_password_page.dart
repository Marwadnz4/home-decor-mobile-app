import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/app_text_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/set_password/presentation/widgets/set_password_form.dart';
import 'package:home_decor/src/core/extensions/navigation.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        context.l10n.setPassword,
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
              Text(
                context.l10n.changePassword,
                textScaler: TextScaler.linear(1.0),
                style:
                    Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              SetPasswordForm(),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              Center(
                child: SizedBox(
                  width: context.screenWidth * 0.4,
                  child: AppTextButton(
                    upperCase: false,
                    text: context.l10n.resetPassword,
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
