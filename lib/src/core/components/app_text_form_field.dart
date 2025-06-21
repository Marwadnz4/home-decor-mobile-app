import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final TextEditingController textEditingController;
  final double? borderRadius;
  final double? height;
  final Widget? prefixIcon;
  final dynamic suffixIcon;
  final Color? filledColor;
  final Color? hintColor;
  final Widget? widget;
  final TextInputType? type;
  final bool? isPassword;
  final FormFieldValidator? validate;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool? readOnly;
  final double? spacing;

  const AppTextFormField({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    required this.textEditingController,
    this.borderRadius,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.filledColor,
    this.hintColor,
    this.widget,
    this.type,
    this.isPassword,
    this.validate,
    this.onChange,
    this.onTap,
    this.readOnly,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.screenHeight * 0.06,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: type ?? TextInputType.text,
        readOnly: readOnly ?? false,
        obscureText: isPassword ?? false,
        onTap: onTap,
        validator: validate,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: const Color(0xff32343E),
          fontWeight: FontWeight.w400,
          fontSize: fontSize ?? context.screenHeight * 0.02,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: context.screenHeight * 0.02,
            horizontal: context.screenWidth * 0.02,
          ),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          filled: true,
          fillColor: filledColor ?? AppColors.melon.withAlpha(70),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: TextStyle(
            fontSize: fontSize ?? context.screenHeight * 0.02,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
          hintText: text,
          hintStyle: TextStyle(
            color: hintColor ?? AppColors.darkVanilla,
          ),
          suffixIcon: suffixIcon,
        ),
        onChanged: onChange,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
