import 'package:flutter/material.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/util/extensions.dart';

class CustomDropdownField<T> extends StatefulWidget {
  const CustomDropdownField({
    required this.items,
    super.key,
    this.isRequired = true,
    this.readOnly = false,
    this.showOptional = false,
    this.isDense = true,
    this.label,
    this.hint,
    this.icon,
    this.onChanged,
    this.value,
  });

  final void Function(T?)? onChanged;
  final bool isRequired, isDense, readOnly, showOptional;
  final String? label;
  final T? value; // Changed from Object? to T?
  final String? hint;
  final IconData? icon;
  final List<DropdownMenuItem<T>> items; // Changed from Object to T

  @override
  State<CustomDropdownField<T>> createState() => _CustomDropdownFieldState<T>();
}

class _CustomDropdownFieldState<T> extends State<CustomDropdownField<T>> {
  // This ValueNotifier is no longer strictly necessary if you rely on the validator,
  // but can be kept if you have other UI that depends on the empty state.
  // The logic inside onChanged has been simplified.

  InputBorder _getBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: color ?? Colors.transparent, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The main build method remains largely the same.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          RichText(
            text: TextSpan(
              text: widget.label,
              style: context.textTheme.bodyMedium,
              children: [
                if (widget.isRequired)
                  const TextSpan(
                    text: '*',
                    // Assuming ColorValues.text50 is your error/required color
                    style: TextStyle(color: ColorValues.danger50),
                  ),
                if (widget.showOptional) // Added showOptional logic
                  TextSpan(
                    text: ' (Optional)',
                    style: context.textTheme.bodySmall?.copyWith(color: ColorValues.grey30),
                  ),
              ],
            ),
          ),
        if (widget.label != null) const SizedBox(height: 8),
        if (widget.readOnly) AbsorbPointer(child: _buildTextField()),
        if (!widget.readOnly) _buildTextField(),
      ],
    );
  }

  Widget _buildTextField() {
    return DropdownButtonFormField<T>(
      icon: const Icon(Icons.keyboard_arrow_down,
          size: 16, color: ColorValues.grey30),
      items: widget.items,
      onChanged: widget.onChanged, // Directly pass the callback
      validator: (T? currentValue) {
        // A better validator checks the field's current value.
        if (widget.isRequired && currentValue == null) {
          return 'Tidak boleh kosong';
        }
        return null;
      },
      isExpanded: true,
      padding: EdgeInsets.zero,
      style: context
          .textTheme
          .bodyMedium
          ?.copyWith(color: const Color(0xFF494949)),
      value: widget.value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Styles.defaultSpacing,
            vertical: Styles.smallSpacing),
        hintText: widget.hint,
        hintStyle:
        context.textTheme.bodySmall?.copyWith(color: ColorValues.grey30),
        filled: true,
        fillColor: widget.readOnly ? const Color(0xFFF5F5F5) : const Color(0xFFECECEC),
        border: _getBorder(),
        isDense: widget.isDense,
        focusedBorder: _getBorder(),
        enabledBorder: _getBorder(),
        // For readOnly state, it's better to use disabledBorder
        disabledBorder: _getBorder(),
        errorBorder: _getBorder(color: ColorValues.danger50),
        focusedErrorBorder: _getBorder(color: ColorValues.danger50),
        prefixIcon: widget.icon == null
            ? null
            : Icon(
          widget.icon,
          size: 16,
          color: ColorValues.grey30,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 60,
        ),
      ),
    );
  }
}