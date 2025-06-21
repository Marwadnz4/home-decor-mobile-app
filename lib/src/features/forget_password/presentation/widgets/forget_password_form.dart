import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/app_text_form_field.dart';
import 'package:home_decor/src/core/extensions/lang.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.enterEmail,
          textScaler: TextScaler.linear(1.0),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        AppTextFormField(
          text: context.l10n.emailAddress,
          filledColor: Colors.white,
          textEditingController: emailController,
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
