import 'package:flutter/material.dart';
import 'package:home_decor/l10n/arb/app_localizations.dart';

class ThinTextButton extends StatelessWidget {
  const ThinTextButton({
    super.key,
    this.onPressed,
    this.foregroundColor,
    required this.child,
  });

  final Color? foregroundColor;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
      ),
      child: Text(
        AppLocalizations.of(context).loginTitle,
        textScaler: TextScaler.linear(1.0),
      ),
    );
  }
}
