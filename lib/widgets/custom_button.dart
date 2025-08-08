import 'package:flutter/material.dart';

import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.buttonText,
    super.key,
    this.onPressed,
    this.backgroundColor = ColorValues.primary50,
    this.isWhiteButton = false,
    this.fontSize,
    this.prefixIcon,
    this.prefixImage,
    this.isWrapped = false,
    this.textColor,
    this.borderColor,
    this.padding,
    this.minHeight = 48,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  final bool isWhiteButton;
  final double? fontSize;
  final IconData? prefixIcon;
  final Color backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final String? prefixImage;
  final bool isWrapped;
  final EdgeInsets? padding;
  final double minHeight;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.isWrapped ? null : double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, widget.minHeight),
          elevation: 0,
          padding: widget.padding,
          backgroundColor:
              widget.isWhiteButton ? Colors.white : widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Styles.defaultBorder),
            side: BorderSide(
              color: widget.borderColor ??
                  (widget.isWhiteButton
                      ? ColorValues.grey10
                      : Theme.of(context).primaryColor),
            ),
          ),
        ),
        child: FittedBox(
          child: Row(
            children: [
              if (widget.prefixIcon != null)
                Icon(
                  widget.prefixIcon,
                  size: 18,
                  color:
                      widget.isWhiteButton ? ColorValues.grey50 : Colors.white,
                ),
              if (widget.prefixImage != null)
                Image.asset(
                  widget.prefixImage!,
                  width: 18,
                  height: 18,
                ),
              if (widget.prefixIcon != null || widget.prefixImage != null)
                const SizedBox(width: Styles.smallerSpacing),
              Text(
                widget.buttonText,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: widget.fontSize ?? 14,
                      color: widget.textColor ?? (widget.isWhiteButton
                          ? ColorValues.text50
                          : Colors.white),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
