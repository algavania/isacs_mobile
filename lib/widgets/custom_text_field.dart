import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    super.key,
    this.validator,
    this.isRequired = true,
    this.isPassword = false,
    this.isDense = false,
    this.isRounded = true,
    this.expands = false,
    this.autofocus = false,
    this.label,
    this.description,
    this.hint,
    this.icon,
    this.textInputType,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.focusNode,
    this.fillColor,
    this.suffixIcon,
    this.readOnly = false,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool isRequired;
  final bool isPassword;
  final bool isDense;
  final String? label;
  final String? description;
  final String? hint;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final bool isRounded;
  final bool expands;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final Color? fillColor;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowPassword = true;

  InputBorder _getBorder({Color color = ColorValues.grey10}) {
    return widget.isRounded
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(Styles.defaultBorder),
            borderSide: BorderSide(color: color),
          )
        : const UnderlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          RichText(
            text: TextSpan(
              text: widget.label,
              style: Theme.of(context).textTheme.displaySmall,
              children: [
                if (widget.isRequired)
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: ColorValues.danger50),
                  ),
              ],
            ),
          ),
        if (widget.description != null) const SizedBox(height: 4),
        if (widget.description != null)
          Text(
            widget.description!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorValues.grey50,
                ),
          ),
        if (widget.label != null) const SizedBox(height: 8),
        if (widget.readOnly) AbsorbPointer(child: _buildTextField(context),)
        else _buildTextField(context),
      ],
    );
  }

  TextFormField _buildTextField(BuildContext context) {
    return TextFormField(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        expands: widget.expands,
        enabled: !widget.readOnly,
        onChanged: widget.onChanged,
        controller: widget.controller,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        style: Theme.of(context).textTheme.displaySmall,
        obscureText: widget.isPassword ? _isShowPassword : false,
        keyboardType: widget.textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          errorMaxLines: 10,
          hintText: widget.hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: ColorValues.grey50),
          filled: true,
          fillColor: widget.fillColor ?? Colors.white,
          border: _getBorder(),
          isDense: widget.isDense,
          focusedBorder: _getBorder(
            color:
                widget.isRounded ? ColorValues.primary50 : Colors.transparent,
          ),
          enabledBorder: _getBorder(),
          disabledBorder: _getBorder(),
          errorBorder: _getBorder(color: ColorValues.danger50),
          focusedErrorBorder: _getBorder(color: ColorValues.danger50),
          prefixIcon: widget.icon == null
              ? null
              : Icon(
                  widget.icon,
                  size: 16,
                  color: ColorValues.grey50,
                ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 60,
          ),
          suffixIcon: widget.suffixIcon != null
              ? Icon(
                  widget.suffixIcon,
                  size: 16,
                  color: ColorValues.grey30,
                )
              : widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isShowPassword = !_isShowPassword;
                        });
                      },
                      child: Icon(
                        size: 16,
                        _isShowPassword
                            ? IconsaxPlusBold.eye_slash
                            : IconsaxPlusBold.eye,
                        color: ColorValues.grey50,
                      ),
                    )
                  : null,
        ),
      );
  }
}
