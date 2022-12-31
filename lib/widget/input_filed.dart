import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../theme/input_theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.inputTheme,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.controller,
    this.initialValue,
    this.enabled,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    // this.autovalidateMode,
    // this.validator,
    this.focusNode,
  }) : super(key: key);

  final InputThemeData inputTheme;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final String? initialValue;
  final bool? enabled;
  final bool readOnly;
  final String obscuringCharacter;
  final bool obscureText;
  // final AutovalidateMode? autovalidateMode;
  // final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        focusNode: focusNode,
        // autovalidateMode: autovalidateMode,
        // validator: validator,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        readOnly: readOnly,
        initialValue: initialValue,
        controller: controller,
        enabled: enabled,
        onSaved: onSaved,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,

        keyboardType: TextInputType.phone,
        textDirection: TextDirection.ltr,
        style: inputTheme.style.copyWith(
            color: inputTheme.style.color ?? Theme.of(context).inputDecorationTheme.focusColor,
            fontSize: inputTheme.style.fontSize ?? 16),

        inputFormatters: [
          inputTheme.mask ??
              MaskTextInputFormatter(
                  // type: MaskAutoCompletionType.eager,
                  mask: "### #### ###",
                  filter: {"#": RegExp(r'[0-9]')})
        ],
        decoration: InputDecoration(
            contentPadding: inputTheme.contentPadding,
            hintText: inputTheme.hintText,
            hintStyle: inputTheme.hintStyle.copyWith(
              color: inputTheme.hintStyle.color ?? Theme.of(context).hintColor,
            ),
            border: inputTheme.border,
            counterText: ""),
      ),
    );
  }
}
