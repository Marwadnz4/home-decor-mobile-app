import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/app_text_form_field.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.emailAddress,
          textScaler: TextScaler.linear(1.0),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: context.screenWidth * 0.05,
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        AppTextFormField(
          text: context.l10n.emailValue,
          textEditingController: emailController,
        ),
        SizedBox(
          height: context.screenHeight * 0.03,
        ),
        Text(
          context.l10n.password,
          textScaler: TextScaler.linear(1.0),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: context.screenWidth * 0.05,
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        AppTextFormField(
          text: context.l10n.passwordValue,
          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: AppColors.darkVanilla,
          ),
          textEditingController: passwordController,
        ),
      ],
    );
  }
}
